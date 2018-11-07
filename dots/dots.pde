Waves[] wss;
PGraphics pg;
void settings() {
  // fullScreen();
  size(1000, 500);
}

void setup() {
  pg = createGraphics(width, height);
  wss = new Waves[2];
  wss[0] = new Waves(pg, 0);
  // wss[1] = new Waves(pg, 150);
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  pg.beginDraw();
  pg.background(255);
  wss[0].draw();
  // wss[1].draw();
  pg.endDraw();
  image(pg, 0, 0);
}

void keyPressed() {
  wss[0].shift();
  // wss[1].shift();
}
