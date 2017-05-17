static int x, y;
static int w, h;
static int ww, hh;
static int gw, gh;

final static byte dx = 15;

static boolean left, right, up;

PImage bg;

Pig pig;

void setup() {
  size(800, 600);
  frameRate(24);
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
  setDirection(keyCode, false);
}

static final void setDirection(int k, boolean decision) {
  if      (k == UP)    up = decision;
  else if (k == LEFT)  left = decision; 
  else if (k == RIGHT) right = decision;
}

static final void moveObject() {
  x += (right? dx : 0) - (left? dx : 0);
}

static final void confineToEdges() {
  x = constrain(x, 0, 720);
  y = constrain(y, 450, 600);
}

void displayObject() {
  pig.display(x, y);
}

void drawPlatform() {
  stroke(153);
  fill(153);
  rect(0, 500, 800, 200);
}