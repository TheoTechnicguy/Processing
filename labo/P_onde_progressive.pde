int rayon=10;

int A=80;
int positionX;
int positionY;
float y;
float omega=1;
float lambda =150;
float t=0;

void setup() {
  size(400, 400);
  positionY=height/2;
  frameRate(25);
  smooth();
}
void draw() {

  background(155);
  t=t+1/frameRate;
  line(0, positionY, width, positionY);
  fill(100,100,0);
  ellipse(25, positionY-A*sin(omega*t-2*PI*25/lambda),rayon,rayon);
  beginShape();
  noFill();
  for (int x=25; x<width; x++) {
    vertex(x, positionY-A*sin(omega*t-2*PI*x/lambda));
  }
  endShape();
}
