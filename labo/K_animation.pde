int rayon=15;
int x;
int y;

void setup() {
  size(400, 400);
  frameRate(1);
}
void draw() {
  ellipse(x,y, rayon, rayon);
  x=x+20;
  y=y+20;
}
