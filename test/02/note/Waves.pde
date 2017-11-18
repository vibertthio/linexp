class Waves {
  int nOfW = 1;
  ArrayList<Wave> waves;
  PGraphics pg;

  Waves() {
    pg = createGraphics(width, height);
    waves = new  ArrayList<Wave>();
    for (int i = 0; i < nOfW; i++) {
      float y = (height * (i + 0.5)) / nOfW;
      waves.add(new Wave(pg, y * 0.01, y));
    }
  }

  void draw() {
    update();
    render();
  }

  void update() {
    pg.beginDraw();
    pg.background(0);
    for (int i = 0; i < nOfW; i++) {
      waves.get(i).draw();
    }
    pg.endDraw();
  }

  void render() {
    tint(255, 10);
    image(pg, 0, 0);
  }

}
