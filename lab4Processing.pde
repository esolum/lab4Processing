static int x, y;
static int w, h;
static int ww, hh;
static int gw, gh;

final static byte dx = 15;

static boolean left, right, up;


Pig pig;

void setup() {
  size(800, 600);
  //background(0, 0, 139);
  frameRate(24);
  
  pig = new Pig(0);
}

void draw() {
  background(0, 0, 139);
  
  moveObject();
  confineToEdges();
  displayObject();
  //pig.display(300, 200);
  
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
  x = constrain(x, 0, 800);
  y = constrain(y, 0, 600);
}

void displayObject() {
  pig.display(x, y);
}