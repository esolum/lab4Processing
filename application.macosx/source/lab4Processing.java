import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class lab4Processing extends PApplet {

static int x, y = 450;
static int w, h;
static int ww, hh;
static int gw, gh;

final static byte dx = 5;

static boolean left, right;
static boolean jumping;
static boolean up = false;
static boolean down = false;
static boolean leftPressed;
static boolean rightPressed;

static int gravity = 4;
static int vY;

PImage bg;

Pig pig;
static Direction dir;

public void setup() {
  
  frameRate(24);
  bg = loadImage("magic.jpeg");
  pig = new Pig(0);
  dir = Direction.RIGHT_STANDING;
  jumping = false;
  leftPressed = false;
  rightPressed = false;
}

public void draw() {
  background(bg);
  drawPlatform();
  moveObject();
  confineToEdges();
  displayObject();
}

public void keyPressed() {
  final int k = keyCode;
  if(k == LEFT) leftPressed = true;
  if(k == RIGHT) rightPressed = true;
  setDirection(k, true);
 
}

public void keyReleased() {
  //setDirection(keyCode, false);
  //println("KEY RELEASED");
  if(keyCode == LEFT) {
    leftPressed = false;
    dir = Direction.LEFT_STANDING;
  }
  
  if(keyCode == RIGHT) {
    rightPressed = false;
    dir = Direction.RIGHT_STANDING;
  }
  
  /*if (keyCode == UP) {   
     if (vY < 6) {
        vY = -6; 
        
     }
  }*/
}

public static final void setDirection(int k, boolean decision) {
  if (k == UP && !jumping) {
    vY = -45;
    jumping = true;
    if(dir == Direction.LEFT || dir == Direction.LEFT_STANDING || dir == Direction.DOWN_LEFT) dir = Direction.UP_LEFT;
        if(dir == Direction.RIGHT || dir == Direction.RIGHT_STANDING || dir == Direction.DOWN_RIGHT) dir = Direction.UP_RIGHT;
    //println("This is a thing");
    /*if (y <= 100) {
      jumping = true;
      up = true;
    }*/
  }
  /*else if(jumping && vY > 0) {
    if(dir == Direction.UP_LEFT) dir = Direction.DOWN_LEFT;
        if(dir == Direction.UP_RIGHT) dir = Direction.DOWN_RIGHT;
  }*/
  else if(k == LEFT) {
    dir = Direction.LEFT;
  }
  else if(k == RIGHT) {
    dir = Direction.RIGHT;
  }
  //if      (k == UP)    up = decision;
  //else if (k == LEFT)  left = decision; 
  //else if (k == RIGHT) right = decision;
}

public static final void moveObject() {
  
  x += (rightPressed? dx : 0) - (leftPressed? dx : 0);
  
  vY += gravity;
  
  y += vY;
  
  if (y > 450) {
     y = 450;
     vY = 0;
     //println("y is greater than 450: ");
     //println("Jumping is false now");
     jumping = false;
     if(leftPressed) dir = Direction.LEFT;
     else if(rightPressed) dir = Direction.RIGHT;
     
     //down = false;
     
  }
  else if(vY > 0) {
    if(dir == Direction.UP_LEFT) dir = Direction.DOWN_LEFT;
    if(dir == Direction.UP_RIGHT) dir = Direction.DOWN_RIGHT;
  }
  else if(vY < 0) {
    if(dir == Direction.LEFT || dir == Direction.LEFT_STANDING) dir = Direction.UP_LEFT;
    if(dir == Direction.RIGHT || dir == Direction.RIGHT_STANDING) dir = Direction.UP_RIGHT;
  }
  
  
  /*if(vY != 0) {
     jumping = true;
     println("VY: " + vY + " direction: " + dir);
  }*/
}

public static final void confineToEdges() {
  x = constrain(x, 0, 720);
  y = constrain(y, 100, 600);
}

public void displayObject() {
  
  if(jumping) {
      pig.drawJumping(x, y, dir);
    
  }
  else if(dir == Direction.LEFT) {
    pig.drawLeft(x, y);
  }
  else if(dir == Direction.RIGHT) {
    pig.drawRight(x, y);
  }
  else {
    pig.drawStanding(x,y, dir);
  }
  
}

public void drawPlatform() {
  stroke(153);
  fill(153);
  rect(0, 500, 800, 200);
}
// Class for animating a sequence of GIFs

class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      // Use nf() to number format 'i' into four digits
      String filename = imagePrefix + nf(i, 4) + ".gif";
      images[i] = loadImage(filename);
    }
  }

  public void display(float xpos, float ypos) {
    frame = (frame+1) % imageCount;
    image(images[frame], xpos, ypos);
  }
  
  public int getWidth() {
    return images[0].width;
  }
}
class Pig {
  PImage image;
  PImage walkingLeft;
  PImage walkingRight;
  PImage walkingLeft2;
  PImage walkingRight2;
  PImage standingLeft;
  PImage standingRight;
  PImage jumpRightUp;
  PImage jumpRightDown;
  PImage jumpLeftUp;
  PImage jumpLeftDown;
  
  int leftCounter;
  int rightCounter;
  
  int accLevel;
  int walkSpeed;
  
  Pig(int accLevel) {
    standingLeft = loadImage("standingLeft.png");
    standingRight = loadImage("standingRight.png");
    walkingLeft = loadImage("walkLeft1.png");
    walkingRight = loadImage("walkRight1.png");
    walkingLeft2 = loadImage("walkLeft2.png");
    walkingRight2 = loadImage("walkRight2.png");
    jumpRightUp = loadImage("jumpRight1.png");
    jumpRightDown = loadImage("jumpRight2.png");
    jumpLeftUp = loadImage("jumpLeft1.png");
    jumpLeftDown = loadImage("jumpLeft2.png");
    leftCounter = 0;
    rightCounter = 0;
    walkSpeed = 20;
    this.accLevel = accLevel;
  }
  
  
  public void drawLeft(float xPos, float yPos) {
    leftCounter++;
    if((leftCounter % walkSpeed) > (walkSpeed/2)) {
        image(walkingLeft2, xPos, yPos);
      }
      else {
        image(walkingLeft, xPos, yPos);
      }
    /*if(walking) {
      
      
    }
    else {
      image(standingLeft, xPos, yPos);
    }*/
  }
  
  public void drawRight(float xPos, float yPos) {
    rightCounter++;
    if((rightCounter % walkSpeed) > (walkSpeed/2)) {
        image(walkingRight2, xPos, yPos);
        
      }
      else {
        image(walkingRight, xPos, yPos);
      }
      
    /*if(walking) {
      
    }
    else {
      image(standingRight, xPos, yPos);
    }*/
  }
  
  public void drawStanding(float xPos, float yPos, Direction dir) {
    if(dir == Direction.LEFT_STANDING || dir == Direction.DOWN_LEFT ||  dir == Direction.LEFT) {
      image(standingLeft, xPos, yPos);
    }
    else {
      image(standingRight, xPos, yPos);
    }
  }
  
  public void drawJumping(int xPos, int yPos, Direction dir) {
    if(dir == Direction.UP_LEFT) {
      image(jumpLeftUp, xPos, yPos);
    }
    else if (dir == Direction.UP_RIGHT) {
      image(jumpRightUp, xPos, yPos);
    }
    
    if(dir == Direction.DOWN_LEFT) {
      image(jumpLeftDown, xPos, yPos);
    }
    else if (dir == Direction.DOWN_RIGHT) {
      image(jumpRightDown, xPos, yPos);
    }
    
    
  }
}
  public void settings() {  size(800, 600); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lab4Processing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
