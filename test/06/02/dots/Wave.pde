class Wave {
  float xoff;
  float yoff;
  float ypos = 0;
  PGraphics pg;
  int index;
  int unit = 40;
  int numberOfPoints;
  int w;
  int interconnectionNumber;

  PVector[] points;
  float[] radius;
  float[] dist;
  float[] distOriginal;

  Wave(int _i, PGraphics _c, float _yo, float _yp) {
    init(_i, _c, _yo, _yp, 4);
  }
  Wave(int _i, PGraphics _c, float _yo, float _yp, int _ico) {
    init(_i, _c, _yo, _yp, _ico);
  }
  void init(int _i, PGraphics _c, float _yo, float _yp, int _icn) {
    index = _i;
    pg = _c;
    yoff = _yo;
    ypos = _yp;
    numberOfPoints = (pg.width / unit) + 3;
    points = new PVector[numberOfPoints];
    interconnectionNumber = _icn;

    radius = new float[numberOfPoints];
    dist = new float[numberOfPoints];
    distOriginal = new float[numberOfPoints];
    for (int i = 0; i < numberOfPoints; i++) {
      radius[i] = random(2, 20);
      dist[i] = random(-unit * 0.5, unit * 0.5);
    }
    arrayCopy(dist, distOriginal);
  }

  void draw() {
    update();
    render();
  }

  void update() {}

  void render() {
    // pg.beginShape();

    // float xoff = 0;       // Option #1: 2D Noise
    float xoff = yoff;    // Option #2: 1D Noise

    // Iterate over horizontal pixels
    float amp = 150;
    int c = 0;
    for (float x = -unit; x <= pg.width + unit; x += unit) {
      float y = map(noise(xoff, yoff), 0, 1, -1 * amp, amp) + ypos; // Option #1: 2D Noise
      // float y = map(noise(xoff), 0, 1, -50, 50) + ypos;    // Option #2: 1D Noise

      // pg.curveVertex(x, y);

      points[c] = new PVector(x + dist[c], y);
      for (int i = c - 1; i > -1 && i > (c - interconnectionNumber); i--) {
        pg.stroke(0, 80 * (1 + sin(xoff * 2) * 0.9));
        pg.strokeWeight(1);
        pg.line(x + dist[c], y, points[i].x, points[i].y);
      }

      pg.fill(0, 255);
      // pg.fill(200 * (1 + sin(xoff * 2) * 0.8), 255);
      pg.noStroke();
      // pg.ellipse(x + dist[c], y, 2, 2);
      pg.ellipse(x + dist[c], y, radius[c] * (1 + sin(xoff * 2) * 0.5), radius[c] * (1 + sin(xoff * 2) * 0.5));
      // Increment x dimension for noise
      xoff += 0.15;

      if (c != 0 && c != numberOfPoints - 1) {
        if (random(1) < 0.005) {
          dist[c] = distOriginal[c];
        } else {
          dist[c] += map(noise(xoff, yoff + c * 1), 0, 1, -0.5, 0.5);
        }
      }

      c++;
    }
    // increment y dimension for noise
    yoff += 0.01;
    // vertex(width, height);
    // vertex(0, height);

    // pg.noFill();
    // pg.stroke(0, 255);
    // pg.strokeWeight(2);
    // pg.endShape();
  }


}
