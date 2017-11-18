// Waves
Waves waves;

void settings() {
  size(1000, 700);
}

void setup() {
  waves = new Waves();
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  waves.draw();
}
