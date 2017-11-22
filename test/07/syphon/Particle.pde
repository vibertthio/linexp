class Particle {
  PGraphics pg;
  float xpos;
  float ypos;
  float zpos;

  Particle(PGraphics _p, float _x, float _y, float _z) {
    pg = _p;
    xpos = _x;
    ypos = _y;
    zpos = _z;
  }

  void draw() {
    update();
    render();
  }

  void update() {

  }

  void render() {
    pg.pushMatrix();
    // pg.translate(xpos, ypos, zpos);
    pg.translate(
      xpos + random(20),
      ypos + random(20),
      zpos + random(20)
    );
    pg.stroke(255);
    pg.strokeWeight(3);
    pg.point(0, 0, 0);
    pg.popMatrix();
  }
}
