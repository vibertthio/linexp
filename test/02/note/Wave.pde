class Wave {
  float xoff;
  float yoff;
  float ypos = 0;
  PGraphics canvas;
  int w;

  Wave(PGraphics _c, float _yo, float _yp) {
    canvas = _c;
    yoff = _yo;
    ypos = _yp;
  }

  void draw() {
    update();
    render();
  }

  void update() {}

  void render() {
    canvas.stroke(255, 255);
    canvas.strokeWeight(50);
    canvas.noFill();
    canvas.beginShape();

    // float xoff = 0;       // Option #1: 2D Noise
    float xoff = yoff;    // Option #2: 1D Noise

    // Iterate over horizontal pixels
    int unit = 40;
    float amp = 300;
    for (float x = -unit; x <= width + unit; x += unit) {
      // Calculate a y value according to noise, map to
      float y = map(noise(xoff, yoff), 0, 1, -1 * amp, amp) + ypos; // Option #1: 2D Noise
      // float y = map(noise(xoff), 0, 1, -50, 50) + ypos;    // Option #2: 1D Noise

      canvas.curveVertex(x, y);
      // Increment x dimension for noise
      xoff += 0.9;
    }
    // increment y dimension for noise
    yoff += 0.01;
    // vertex(width, height);
    // vertex(0, height);
    canvas.endShape();
  }


}
