int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 0.1;
float D_COEF = 0.09;
float K_CONSTANT = -40000;

int SPRING_LENGTH = 150;
float  SPRING_K = 0.005;

int GRAVITY = 0;
int DRAGF = 1;
int SPRINGF = 2;
int ELECTROMAGNETICF = 3;
boolean[] toggles = new boolean[4];
String[] modes = {"Gravity", "Drag", "Spring", "Electromagnetic"};

OrbList OrbsList = new OrbList();

void setup() {
  size(600, 600);
  background(255);
  OrbsList.populate();
}

void draw() {
  background(250);
  stroke(255);
  fill(255);
  circle(width / 2, height / 2, 500);
  displayMode();
  OrbsList.display();
  if (toggles[0]) {
    OrbsList.applyGravity(G_CONSTANT);
  }
  if (toggles[1])  {
    OrbsList.applyDrag(D_COEF);
  }
  if (toggles[2])  {
    OrbsList.applySprings(SPRING_LENGTH, SPRING_K);
  }
  if (toggles[3])  {
    OrbsList.applyElectromagnetic(K_CONSTANT);
  }
  OrbsList.run();
}

void keyPressed() {
  if (key == 'g') {
    toggles[GRAVITY] = !toggles[GRAVITY];
  }
  if (key == 'd') {
    toggles[DRAGF] = !toggles[DRAGF];
  }
  if (key == 's') {
    toggles[SPRINGF] = !toggles[SPRINGF];
  }
  if (key == 'e') {
    toggles[ELECTROMAGNETICF] = !toggles[ELECTROMAGNETICF];
    if (!toggles[ELECTROMAGNETICF])  {
      OrbsList.cancelElectromagnetic();
    }
  }
}

void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int x = 0;
  for (int m = 0; m < toggles.length; m++) {
    fill(toggles[m] ? color(0, 255, 0) : color(255, 0, 0));
    float tW = textWidth(modes[m]);
    rect(x, 0, tW + 5, 20);
    fill(0);
    text(modes[m], x + 2, 2);
    x += tW + 5;
  }
}
