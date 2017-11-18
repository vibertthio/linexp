float mouseControl;
class Waves {
  int nOfW = 20;
  ArrayList<Wave> waves;
  PGraphics pg;

  Waves() {
    pg = createGraphics(width, height);
    waves = new  ArrayList<Wave>();
    float band = 600;
    float h = (height - band);
    for (int i = 0; i < nOfW; i++) {
      float y = (h * (i + 0.5)) / nOfW + band * 0.5;
      waves.add(new Wave(i, pg, y * 0.01, y));
    }
  }

  void draw() {
    update();
    render();
  }

  void update() {
    mouseControl = map(mouseY, 0, height, 0, 0.01);
    pg.beginDraw();
    pg.background(0);
    for (int i = 0; i < nOfW; i++) {
      waves.get(i).draw();
    }
    pg.endDraw();
  }

  void render() {
    tint(255, 20);
    image(pg, 0, 0);
  }

}
