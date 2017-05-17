static int x, y;
static int w, h;
static int ww, hh;
static int gw, gh;

final static byte dx = 5;

static boolean left, right, up;
static boolean jumping = false;

PImage bg;

Pig pig;
static Direction dir;

void setup() {
  size(800, 600);
  frameRate(30);
  bg = loadImage("images/magic.jpeg");
  pig = new Pig(0);
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
  setDirection(k, true);
}

void keyReleased() {
  //setDirection(keyCode, false);
  //println("KEY RELEASED");
  if(keyCode == LEFT) {
    dir = Direction.LEFT_STANDING;
  }
  
  if(keyCode == RIGHT) {
    dir = Direction.RIGHT_STANDING;
  }
  
  
}

static final void setDirection(int k, boolean decision) {
  if (k == UP && !jumping) {
    jumping = true;
  }
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
  x += (dir == Direction.RIGHT? dx : 0) - (dir == Direction.LEFT? dx : 0);
}

static final void confineToEdges() {
  x = constrain(x, 0, 720);
  y = constrain(y, 450, 600);
}

void displayObject() {
  if(dir == Direction.LEFT) {
    pig.drawLeft(x, y);
  }
  else if(dir == Direction.RIGHT) {
    pig.drawRight(x, y);
  }
  else {
    //println("Standstandstand");
    pig.drawStanding(x,y, dir);
  }
  
}

void drawPlatform() {
  stroke(153);
  fill(153);
  rect(0, 500, 800, 200);
}