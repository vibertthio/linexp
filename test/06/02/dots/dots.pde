PGraphics pg;
System system;
void settings() {
  // fullScreen();
  size(1000, 500);
  // size(1500, 500);
}

void setup() {
  pg = createGraphics(width, height);
  system = new System(pg);
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  pg.beginDraw();
  pg.background(255);
  system.draw();
  pg.endDraw();
  image(pg, 0, 0);
  morph();
}

void morph() {
  if (frameCount % 10 == 8) {
    if (random(1) > 0.2) {
      system.updateConnection();
    }
  }
  if (frameCount % 10 == 0) {
    if (random(1) > 0.2) {
      // system.wss[0].shift();
    }
  }
  if (frameCount % 10 == 5) {
    if (random(1) > 0.2) {
      // system.wss[1].shift();
    }
  }
}

void keyPressed() {
  if (key == 'q') {
    system.wss[0].shift();
  }
  if (key == 'a') {
    system.wss[1].shift();
  }
  if (key == 'z') {
    system.updateConnection();
  }
}
