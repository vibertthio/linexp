import codeanticode.syphon.*;


PGraphics pup;
boolean[] view = { false, false, false, false };
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

  pup = createGraphics(floor(width / nOfV), height, P3D);
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
    if (!view[i]) {
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
    } else {
      pupView(i * width / nOfV);
    }
  }

  pgout.endDraw();

  image(pgout, 0, 0);
  server.sendImage(pgout);
}

void keyPressed() {
  if (key == '1') {
    view[0] = !view[0];
  }
  if (key == '2') {
    view[1] = !view[1];
  }
  if (key == '3') {
    view[2] = !view[2];
  }
  if (key == '4') {
    view[3] = !view[3];
  }
}
void pupView() {
  pupView(0);
}
void pupView(float x) {
  pup.beginDraw();
  pup.background(0);

  pup.beginCamera();
  pup.camera();
  pup.translate(pup.width/2, pup.height/2, -1200);
  pup.rotateY(frameCount * 0.005);
  pup.endCamera();

  for (int j = 0; j < nOfP; j++) {
    ps[j].render(pup);
  }

  pup.endDraw();
  pgout.image(pup, x, 0);
}
