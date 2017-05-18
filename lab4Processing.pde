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

void setup() {
  size(800, 600);
  frameRate(30);
  bg = loadImage("images/magic.jpeg");
  pig = new Pig(0);
  dir = Direction.RIGHT_STANDING;
  jumping = false;
  leftPressed = false;
  rightPressed = false;
}

void draw() {
  background(bg);
  drawPlatform();
  moveObject();
  confineToEdges();
  displayObject();
}

void keyPressed() {
  final int k = keyCode;
  if(k == LEFT) leftPressed = true;
  if(k == RIGHT) rightPressed = true;
  setDirection(k, true);
 
}

void keyReleased() {
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

static final void setDirection(int k, boolean decision) {
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

static final void moveObject() {
  
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

static final void confineToEdges() {
  x = constrain(x, 0, 720);
  y = constrain(y, 100, 600);
}

void displayObject() {
  
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

void drawPlatform() {
  stroke(153);
  fill(153);
  rect(0, 500, 800, 200);
}