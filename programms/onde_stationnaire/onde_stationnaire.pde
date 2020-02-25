//variables:
Float A=0.08;
Float L=0.6;
Float x=50.0;
Float lambda=0.15;
Float omega= 2*PI;
Float f=1.0;
Float y;
Float v=0.15;
float t;



void setup () {
  size (800, 800);
  frameRate (60);
}

void draw () {
  background (155);
  t=t+(1/frameRate);
  fill(255);
  beginShape();
  
  for (x=50.0; x<=width; x=x+1) {
    y= 2*A*(sin(2*PI*(L-x)/lambda))*cos (((omega*t)-((2*PI*L)/lambda)));
    vertex (x, (height/2)-y);
  }
  for (x=50.0; x>=width; x=x+1) {
    y=-y;
  }
  if (x>=width);
  {
    v=-v;
  }
  endShape ();
}
