class Waves {
  PGraphics pg;
  float yoffset;
  Wave[] waves;
  int[][] connectionNumber;

  Waves(PGraphics _p, float _y) {
    // pg = createGraphics(width, height);
    pg = _p;
    yoffset = _y;
    waves = new Wave[3];
    waves[0] = new Wave(0, pg, random(0, 5), height * 0.5 + _y, 3);
    waves[1] = new Wave(1, pg, random(0, 5), height * 0.45 + _y);
    waves[2] = new Wave(2, pg, random(0, 5), height * 0.6 + _y);

    connectionNumber = new int[2][waves[0].numberOfPoints];
    for (int i = 0; i < connectionNumber[0].length; i++) {
      if (random(1) > 0.8) {
        connectionNumber[0][i] = floor(random(3)) + 1;
      } else {
        connectionNumber[0][i] = 0;
      }
      if (random(1) > 0.8) {
        connectionNumber[1][i] = floor(random(3)) + 1;
      } else {
        connectionNumber[1][i] = 0;
      }
    }
  }

  void draw() {
    update();
    render();
  }
  void update() {

  }
  void render() {
    waves[0].draw();
    waves[1].draw();
    waves[2].draw();
    drawConnection();
  }
  void drawConnection() {
    pg.stroke(0, 20);
    pg.strokeWeight(1);
    for (int i = 0; i < connectionNumber[0].length; i++) {
      int n = connectionNumber[0][i];
      for (int j = 1; j <= n; j++) {
        if (i - j >= 0) {
          pg.line(
          waves[0].points[i].x,
          waves[0].points[i].y,
          waves[2].points[i - j].x,
          waves[2].points[i - j].y);
        }

        if (i + j < connectionNumber[0].length) {
          pg.line(
            waves[0].points[i].x,
            waves[0].points[i].y,
            waves[1].points[i + j].x,
            waves[1].points[i + j].y);
        }
      }
      n = connectionNumber[1][i];
      for (int j = 1; j <= n; j++) {
        if (i - j >= 0) {
          pg.line(
          waves[0].points[i].x,
          waves[0].points[i].y,
          waves[2].points[i - j].x,
          waves[2].points[i - j].y);
        }

        if (i + j < connectionNumber[0].length) {
          pg.line(
            waves[0].points[i].x,
            waves[0].points[i].y,
            waves[2].points[i + j].x,
            waves[2].points[i + j].y);
        }
      }
    }
  }

  // utils
  void shift() {
    waves[0].yoff += 10;
    waves[1].yoff += 10;
    waves[2].yoff += 10;
  }
}
