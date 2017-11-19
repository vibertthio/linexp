class System {
  PGraphics pg;
  Waves[] wss;
  int[][] connectionNumber;

  System(PGraphics _p) {
    pg = _p;
    wss = new Waves[2];
    wss[0] = new Waves(pg, -100);
    wss[1] = new Waves(pg, 100);
    initConnection();
  }

  void draw() {
    wss[0].draw();
    wss[1].draw();
    drawConnection();
  }

  void initConnection() {
    connectionNumber = new int[2][wss[0].waves[0].numberOfPoints];
    updateConnection();
  }
  void updateConnection() {
    for (int i = 0; i < connectionNumber[0].length; i++) {
      if (random(1) > 0.9) {
        connectionNumber[0][i] = floor(random(2)) + 1;
      } else {
        connectionNumber[0][i] = 0;
      }
      if (random(1) > 0.9) {
        connectionNumber[1][i] = floor(random(2)) + 1;
      } else {
        connectionNumber[1][i] = 0;
      }
    }
  }
  void drawConnection() {
    pg.stroke(0, 20);
    pg.strokeWeight(1);
    for (int i = 0; i < connectionNumber[0].length; i++) {
      int n = connectionNumber[0][i];
      for (int j = 1; j <= n; j++) {
        if (i - j >= 0) {
          pg.line(
          wss[0].waves[2].points[i].x,
          wss[0].waves[2].points[i].y,
          wss[1].waves[1].points[i - j].x,
          wss[1].waves[1].points[i - j].y);
        }

        if (i + j < connectionNumber[0].length) {
          pg.line(
          wss[0].waves[2].points[i].x,
          wss[0].waves[2].points[i].y,
          wss[1].waves[1].points[i + j].x,
          wss[1].waves[1].points[i + j].y);
        }
      }
      n = connectionNumber[1][i];
      for (int j = 1; j <= n; j++) {
        if (i - j >= 0) {
          pg.line(
          wss[1].waves[1].points[i].x,
          wss[1].waves[1].points[i].y,
          wss[0].waves[2].points[i - j].x,
          wss[0].waves[2].points[i - j].y);
        }

        if (i + j < connectionNumber[0].length) {
          pg.line(
          wss[1].waves[1].points[i].x,
          wss[1].waves[1].points[i].y,
          wss[0].waves[2].points[i + j].x,
          wss[0].waves[2].points[i + j].y);
        }
      }
    }
  }
}
