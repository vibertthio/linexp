
class Ball {
  PVector org, loc;
  float sz = 2;
  float radius, offSet, a;
  int s, dir, countC, d = 30;
  boolean[] connection = new boolean[nOfB];

  Ball(PVector _org, PVector _loc, float _radius, int _dir, float _offSet, float _sz) {
    org = _org;
    loc = _loc;
    radius = _radius;
    dir = _dir;
    offSet = _offSet;
    sz = _sz;
  }

  void run() {
    display();
    move();
    lineBetween();
  }

  void move() {
    org.x += 1;
    if (org.x > width + 30) {
      org.x = -30;
    }
    loc.x = org.x + sin(theta*dir+offSet)*radius;
    loc.y = org.y + cos(theta*dir+offSet)*radius;
  }

  void lineBetween() {
    countC = 1;

    for (int i=0; i < balls.size(); i++) {
      Ball other = (Ball) balls.get(i);
      float distance = loc.dist(other.loc);
      if (distance > 0 && distance < d) {
        a = map(countC, 0, 10, 10, 100);
        stroke(255, a);
        line(loc.x, loc.y, other.loc.x, other.loc.y);
        connection[i] = true;
        countC++;
      }
      else {
        connection[i] = false;
      }
    }
  }

  void display() {
    noStroke();
    // fill(255, 200);
    fill(255, map(sz, 2, 20, 200, 30));
    ellipse(loc.x, loc.y, sz, sz);
  }
}
