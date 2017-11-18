import peasy.*;
PeasyCam cam;

void settings() {
  size(500, 500, P3D);
}

void setup() {
  background(0);
  cam = new PeasyCam(this, 400);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2000);
}

void draw() {
  translate(width * 0.5, height * 0.5);
  sphere(100);
}
