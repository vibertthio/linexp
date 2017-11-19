void settings() {
  fullScreen();
  // size(800, 800);
}

PGraphics pg;
ArrayList<Ball> balls;
float angle = 0;
float destAngle = 0;
int count = 0;

void setup() {
  pg = createGraphics(width, height);
  balls = new ArrayList<Ball>();
  balls.add(new Ball(
    pg,
    width * 0.5,
    height * 0.5,
    height * 0.3,
    height * 0.1
  ));
  balls.add(new Ball(
    pg,
    width * 0.55,
    height * 0.45,
    height * 0.1,
    height * 0.1
  ));
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  background(255);
  pg.beginDraw();
  for (int i = 0; i < balls.size(); i++) {
    balls.get(i).draw();
  }
  pg.endDraw();
  // tint(255, 100);
  updateAngle();

  pushMatrix();
  translate(width * 0.5, height * 0.5);
  rotate(angle);
  imageMode(CENTER);
  // scale((1 + 0.05 * sin(count * 0.05)));
  image(pg, 0, 0);
  popMatrix();

  count++;
}

void updateAngle() {
  if (abs(destAngle - angle) > 1) {
    destAngle = map(mouseX, 0, width, 0, 2 * PI);
    angle += (destAngle - angle) * 0.05;
  }
}
