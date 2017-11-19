class Ball {
  PGraphics pg;
  float xpos;
  float ypos;
  float radius;
  float dist;
  float theta;
  float x;
  float y;

  Ball(PGraphics _p, float _x, float _y) {
    init(_p, _x, _y, _p.width * 0.3, _p.width * 0.15);
  }
  Ball(PGraphics _p, float _x, float _y, float _r, float _d) {
    init(_p, _x, _y, _r, _d);
  }
  void init(PGraphics _p, float _x, float _y, float _r, float _d) {
    pg = _p;
    xpos = _x;
    ypos = _y;
    radius = _r;
    dist = _d;
    x = pg.width * 0.5 + radius;
    y = pg.height * 0.5;
  }

  void draw() {
    update();
    if (random(1) > 0.5) {
      render();
    }
  }
  void update() {

  }
  void render() {
    // if (random(1) > 0.2) {
    //   pg.stroke(255, 100);
    // } else {
    //   pg.stroke(0, 100);
    // }
    pg.stroke(0, 100);
    pg.strokeWeight(0.5);
    theta = random(0, 2 * PI);
    float d = dist * random(1);
    float nx = width * 0.5 + (radius + d) * cos(theta);
    float ny = height * 0.5 + (radius + d) * sin(theta);
    pg.line(x, y, nx, ny);
    x = nx;
    y = ny;
  }

}
