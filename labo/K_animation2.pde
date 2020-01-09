int rayon=15;
int x=100;
int y=150;
int incrementX=10;
int incrementY=12;

void setup() {
  size(400, 400);
  frameRate(25);
}
void draw() {
  background(150);
  ellipse(x, y, rayon, rayon);
  if (x>width-rayon) {
    incrementX=-incrementX;
  }
  if (x<rayon) {
    incrementX=-incrementX;
  }
  if (y>height-rayon) {
    incrementY=-incrementY;
  }
  if (y<rayon) {
    incrementY=-incrementY;
  }
  x=x+incrementX;
  y=y+incrementY;
}
