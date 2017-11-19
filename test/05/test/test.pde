import peasy.*;
PeasyCam cam;

void settings() {
  size(1000, 1000, P3D);
}

void setup() {
  background(0);
  cam = new PeasyCam(this, 400);
  cam.setMinimumDistance(10);
  cam.setMaximumDistance(2000);
}

void draw() {
  background(0);
  stroke(255);
  strokeWeight(10);
  point(0, 0, 0);
  point(0, 500, 0);
}
