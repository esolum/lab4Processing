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
    if(dir == Direction.LEFT_STANDING || dir == Direction.DOWN_LEFT ||  dir == Direction.LEFT) {
      image(standingLeft, xPos, yPos);
    }
    else {
      image(standingRight, xPos, yPos);
    }
  }
  
  void drawJumping(int xPos, int yPos, Direction dir) {
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