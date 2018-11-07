Waves[] ws;
PGraphics pg;
void settings() {
  size(1000, 600);
  // fullScreen();
}

void setup() {
  pg = createGraphics(width, height);
  ws = new Waves[2];
  ws[0] = new Waves(pg, 0);
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  pg.beginDraw();
  pg.background(255);
  ws[0].draw();
  pg.endDraw();
  image(pg, 0, 0);
}
