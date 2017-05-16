Pig pig;

void setup() {
  size(800, 600);
  background(0, 0, 139);
  frameRate(24);
  
  pig = new Pig(0);
}

void draw() {
  pig.display(300, 200);
}