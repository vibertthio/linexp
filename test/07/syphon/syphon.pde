import codeanticode.syphon.*;

PGraphics pg;
SyphonServer server;
Particle[] ps;
int nOfP = 200;
float rad = 100;

void settings() {
  size(1280, 380, P3D);
  PJOGL.profile=1;
}

void setup() {
  pg = createGraphics(1280, 380, P3D);
  server = new SyphonServer(this, "Processing Syphon");

  ps = new Particle[nOfP];
  for (int i = 0; i < nOfP; i++) {
    float phy = random(PI);
    float angle = random(2 * PI);
    float x = rad * sin(phy) * cos(angle);
    float y = rad * sin(phy) * sin(angle);
    float z = rad * cos(phy);
    ps[i] = new Particle(pg, x, y, z);
  }
}

void draw() {
  pg.beginDraw();
  pg.background(0);
  // pg.lights();
  pg.translate(width/2, height/2);

  for (int i = 0; i < nOfP; i++) {
    ps[i].draw();
  }

  if (frameCount % 5 == 0) {
    update();
  }

  pg.endDraw();
  image(pg, 0, 0);
  server.sendImage(pg);
}

void update() {
  float rad = 100 * (1 + 0.3 * sin(0.05 * frameCount));
  for (int i = 0; i < nOfP; i++) {
    float phy = random(PI);
    float angle = random(2 * PI);
    ps[i].xpos = rad * sin(phy) * cos(angle);
    ps[i].ypos = rad * sin(phy) * sin(angle);
    ps[i].zpos = rad * cos(phy);
  }
}
