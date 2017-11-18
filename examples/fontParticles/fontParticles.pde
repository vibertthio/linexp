int fc, num = 800;
ArrayList ballCollection;
boolean save = false;
float scal, theta;
PGraphics letter;
PFont font;
String l = "S";

void setup() {
  background(20);
  size(400, 400);
  letter = createGraphics(width, height);
  font = loadFont("Arial-Black-250.vlw");
  ballCollection = new ArrayList();
  createStuff();
}

void draw() {
  frame.setTitle(nf(frameRate, 2, 1));
  background(20);

  for (int i=0; i<ballCollection.size (); i++) {
    Ball mb = (Ball) ballCollection.get(i);
    mb.run();
  }

  theta += .0523;

  if (save) {
    if (frameCount%1==0 && frameCount < fc + 30) saveFrame("image-####.gif");
  }
}

void keyPressed() {
  if (key != CODED) l = str(key);
  createStuff();
}

void mouseReleased() {
  //createStuff();
  //fc = frameCount;
  //save = true;
  //saveFrame("image-###.gif");
}

void createStuff() {
  ballCollection.clear();

  letter.beginDraw();
  letter.noStroke();
  letter.background(255);
  letter.fill(0);
  letter.textFont(font, 400);
  letter.textAlign(CENTER);
  letter.text(l, 200, 350);
  letter.endDraw();
  letter.loadPixels();

  for (int i=0; i<num; i++) {
    int x = (int)random(width);
    int y = (int)random(height);
    //color c = letter.get(x, y);
    int c = letter.pixels[x+y*width];
    if (brightness(c)<255) {
      PVector org = new PVector(x, y);
      float radius = random(5, 10);
      PVector loc = new PVector(org.x+radius, org.y);
      float offSet = random(TWO_PI);
      int dir = 1;
      float r = random(1);
      if (r>.5) dir =-1;
      Ball myBall = new Ball(org, loc, radius, dir, offSet);
      ballCollection.add(myBall);
    }
  }
}
