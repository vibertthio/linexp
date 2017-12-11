import codeanticode.syphon.*;

PGraphics[] pgs;
int nOfV = 4;
PGraphics pgout;
PShader shade;
SyphonServer server;
Particle[] ps;
int nOfP = 200;
float rad = 500;


void settings() {
  size(1280, 380, P3D);
  PJOGL.profile=1;
}

void setup() {
  pgout = createGraphics(width, height, P2D);
  server = new SyphonServer(this, "Processing Syphon");

  pgs = new PGraphics[nOfV];
  for (int i = 0; i < nOfV; i++) {
    pgs[i] = createGraphics(floor(width / nOfV), height, P3D);
  }

  ps = new Particle[nOfP];
  for (int i = 0; i < nOfP; i++) {
    float phy = random(PI);
    float angle = random(2 * PI);
    float x = rad * sin(phy) * cos(angle);
    float y = rad * sin(phy) * sin(angle);
    float z = rad * cos(phy);
    ps[i] = new Particle(x, y, z);
  }
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  for (int i = 0; i < nOfP; i++) {
    ps[i].update();
  }

  pgout.beginDraw();

  for (int i = 0; i < nOfV; i++) {
    PGraphics pg = pgs[i];
    pg.beginDraw();
    pg.background(0);

    pg.beginCamera();
    pg.camera();
    pg.translate(pg.width/2, pg.height/2);
    pg.rotateY(frameCount * 0.01 + PI * 0.5 * i);
    pg.endCamera();

    for (int j = 0; j < nOfP; j++) {
      ps[j].render(pg);
    }

    pg.endDraw();
    pgout.image(pg, i * width / nOfV, 0);
  }


  pgout.endDraw();

  image(pgout, 0, 0);
  server.sendImage(pgout);
}
