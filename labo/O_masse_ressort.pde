int rayon=20;

int A=80;
int positionX;
int positionY;
float y;
float masse=1;
float k=1;
float omega=pow(k/masse, 0.5);
float t=0;

void setup() {
  size(400, 400);
  positionX=width/4*3;
  positionY=height/2;
  frameRate(25);
}
void draw() {

  background(155);
  y=A*sin(omega*t);
  ellipse(positionX, positionY-y, rayon, rayon);
  t=t+1/frameRate;
  stroke(180, 0, 0);
  noFill();
  ellipse(width/4, positionY,2*A,2*A);
  fill(255);
  line(width/4, positionY,width/4+A*cos(omega*t), positionY-A*sin(omega*t));
  line(0, positionY, width, positionY);
  line(positionX,positionY,positionX,positionY-y);
  stroke(255);
  text("élongation : " + y,30,30);
  text("temps : " + t + " s",30,60);
  text("angle : " + degrees(omega*t) + " °",30,90);
  
}
