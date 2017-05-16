class Pig {
  PImage image;
  
  int accLevel;
  
  Pig(int accLevel) {
    image = loadImage("images/standingLeft.png");
    this.accLevel = accLevel;
  }
  
  void display(float xPos, float yPos) {
    image(image, xPos, yPos);
  }
}