Waves[] ws;
PGraphics pg;
void settings() {
  fullScreen();
  // size(1000, 600);
}

void setup() {
  pg = createGraphics(width, height);
  ws = new Waves[2];
  ws[0] = new Waves(pg, -150);
  ws[1] = new Waves(pg, 150);
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  pg.beginDraw();
  pg.background(255);
  ws[0].draw();
  ws[1].draw();
  pg.endDraw();
  image(pg, 0, 0);
}
