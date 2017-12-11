float t;

void setup(){
  background(0);
  size(1080,720);
}

void draw(){
  background(0);
  translate(width/2 , height/2);
  for(int i = 0; i < 255; i++){
    stroke(255, i/2);
    strokeWeight(1);
    line(xpos1(t), ypos1(t), xpos2(t), ypos2(t));
    t += 0.1;
  }
  t -= 254 * 0.1;
}

void mousePressed(){
  //saveFrame("05.png");
}

float xpos1(float t){
  return cos(t/30) * 300 + sin(t/5) * 50;
}

float ypos1(float t){
  return sin(t/3) * 150 + cos(t/5) * 150;
}

float xpos2(float t){
  return cos(t/10) * 200 + sin(t/15) * 70;
}

float ypos2(float t){
  return sin(t/20) * 100+ cos(t/15) * 190;
}
