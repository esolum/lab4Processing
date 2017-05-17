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
    standingLeft = loadImage("images/pigSprites/standingLeft.png");
    standingRight = loadImage("images/pigSprites/standingRight.png");
    walkingLeft = loadImage("images/pigSprites/walkLeft1.png");
    walkingRight = loadImage("images/pigSprites/walkRight1.png");
    walkingLeft2 = loadImage("images/pigSprites/walkLeft2.png");
    walkingRight2 = loadImage("images/pigSprites/walkRight2.png");
    jumpRightUp = loadImage("images/pigSprites/jumpRight1.png");
    jumpRightDown = loadImage("images/pigSprites/jumpRight2.png");
    jumpLeftUp = loadImage("images/pigSprites/jumpLeft1.png");
    jumpLeftDown = loadImage("images/pigSprites/jumpLeft2.png");
    leftCounter = 0;
    rightCounter = 0;
    walkSpeed = 20;
    this.accLevel = accLevel;
  }
  
  
  void drawLeft(float xPos, float yPos) {
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
  
  void drawRight(float xPos, float yPos) {
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
  
  void drawStanding(float xPos, float yPos, Direction dir) {
    if(dir == Direction.LEFT_STANDING) {
      image(standingLeft, xPos, yPos);
    }
    else {
      image(standingRight, xPos, yPos);
    }
  }
}