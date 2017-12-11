class Particle {
  // PGraphics pg;
  float xpos;
  float xorg;
  float xspan;
  float xoff;

  float ypos;
  float yorg;
  float yspan;
  float yoff;

  float zpos;
  float zorg;
  float zspan;
  float zoff;

  float alpha;
  float alphaOrg;
  float alphaSpan;
  float alphaOff;

  float sz;
  float szOrg;
  float szOff;

  Particle(float _x, float _y, float _z) {
    // pg = _p;
    xpos = _x;
    xorg = _x;
    ypos = _y;
    yorg = _y;
    zpos = _z;
    zorg = _z;

    yoff = random(0, 2 * PI);
    yspan = random(10, 20);
    xoff = random(0, 2 * PI);
    xspan = random(0, 30);

    alpha = random(200, 250);
    alphaOrg = alpha;
    alphaSpan = 255 - alphaOrg;
    alphaOff = random(0, 2 * PI);

    sz = random(3, 8);
    szOrg = sz;
    szOff = random(0, 2 * PI);
  }

  void draw(PGraphics pg) {
    update();
    render(pg);
  }

  void update() {
    ypos = yorg + yspan * sin(frameCount * 0.01 + yoff);
    xpos = xorg + xspan * sin(frameCount * 0.01 + xoff);

    // alpha = alphaOrg + alphaSpan * sin(frameCount * 0.005 + alphaOff);
    sz = szOrg * (1 + 0.2 * sin(frameCount * 0.002 + szOff));
  }

  void render(PGraphics pg) {
    pg.pushMatrix();
    pg.translate(xpos, ypos, zpos);
    pg.stroke(alpha);
    pg.strokeWeight(sz);
    pg.point(0, 0, 0);
    pg.popMatrix();
  }
}
