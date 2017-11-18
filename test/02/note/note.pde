/***
Main
***/

// Waves
Waves waves;

// Balls
ArrayList<Ball> balls;
int nOfB = 400;
float theta = 0;

void settings() {
  size(1000, 700);
}

void setup() {
  waves = new Waves();
  balls = new ArrayList<Ball>();
  snapshot();
}

void draw() {
  surface.setTitle(nf(frameRate, 2, 1));
  background(20);

  for (int i = 0; i < balls.size(); i++) {
    Ball b = (Ball) balls.get(i);
    b.run();
  }
  // waves.render();

  float v = map(mouseY, height, 0, 0.05, 0.2);
  theta += v;
  // theta += .0523;
}

/***
Others
***/

void keyPressed() {
  if (key == 'a') {
    snapshot();
  }

  if (key == 's') {
    for (int i = 0; i < 100; i++) {
      waves.update();
    }
  }
}

void snapshot() {
  waves.update();
  waves.pg.loadPixels();
  balls.clear();
  int count = 0;

  while(count < nOfB) {
    int x = (int)random(width);
    int y = (int)random(height);
    int c = waves.pg.pixels[x + (y * width)];

    if (brightness(c) > 250) {
      PVector org = new PVector(x, y);
      float radius = random(5, 50);
      PVector loc = new PVector(org.x + radius, org.y);
      float offSet = random(TWO_PI);
      int dir = 1;
      float r = random(1);
      if (r > 0.5) {
        dir =-1;
      }
      // float sz = random(2, 20);
      float sz = 2;
      Ball b = new Ball(org, loc, radius, dir, offSet, sz);
      balls.add(b);
      count += 1;
    }
  }
}
