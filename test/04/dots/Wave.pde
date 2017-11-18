class Wave {
  float xoff;
  float yoff;
  float ypos = 0;
  PGraphics canvas;
  int index;
  int unit = 40;
  int numberOfPoints = (width / unit) + 3;
  int w;

  PVector[] points;
  float[] radius;
  float[] dist;

  Wave(int _i, PGraphics _c, float _yo, float _yp) {
    index = _i;
    canvas = _c;
    yoff = _yo;
    ypos = _yp;
    points = new PVector[numberOfPoints];

    radius = new float[numberOfPoints];
    dist = new float[numberOfPoints];
    for (int i = 0; i < numberOfPoints; i++) {
      if (random(1) > 0.3) {
        radius[i] = random(0.1, 10);
      } else {
        radius[i] = random(15, 30);
      }
      radius[i] = 2;
      dist[i] = random(-20, 20);
    }
  }

  void draw() {
    update();
    render();
  }

  void update() {}

  void render() {
    // canvas.beginShape();

    // float xoff = 0;       // Option #1: 2D Noise
    float xoff = yoff;    // Option #2: 1D Noise

    // Iterate over horizontal pixels
    float amp = 150;
    int c = 0;
    for (float x = -unit; x <= width + unit; x += unit) {
      float y = map(noise(xoff, yoff), 0, 1, -1 * amp, amp) + ypos; // Option #1: 2D Noise
      // float y = map(noise(xoff), 0, 1, -50, 50) + ypos;    // Option #2: 1D Noise

      // canvas.curveVertex(x, y);

      canvas.fill(0, 255);
      canvas.noStroke();
      // canvas.ellipse(x, y, 10, 10);
      canvas.ellipse(x + dist[c], y, radius[c], radius[c]);
      // Increment x dimension for noise
      xoff += 0.15;

      points[c] = new PVector(x + dist[c], y);
      for (int i = c - 1; i > -1 && i > (c - 5); i--) {
        canvas.stroke(0, 20);
        canvas.strokeWeight(1);
        canvas.line(x + dist[c], y, points[i].x, points[i].y);
      }

      if (c != 0 && c != numberOfPoints - 1) {
        dist[c] += map(noise(xoff, yoff + c * 0.01), 0, 1, -0.5, 0.5);
      }

      c++;
    }
    // increment y dimension for noise
    yoff += 0.01;
    // vertex(width, height);
    // vertex(0, height);

    canvas.noFill();
    canvas.stroke(0, 255);
    canvas.strokeWeight(2);
    // canvas.endShape();
  }


}
