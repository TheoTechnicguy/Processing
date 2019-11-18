int x = 0;
int y = 0;
int step=20;
float dx = step;
float dy = step;
boolean start = true;
float R=255;
float G=255;
float B=255;

void setup() {
  size(2000, 1000);
  background(0);
  frameRate(25);
  noStroke();
  textSize(25);
}

void draw() {
  background(0);
  fill(R,G,B);
  ellipse(x, y, 50, 50);
  y+=dy;
  x+=dx;
  fill(255);
  text("x: "+x, 50, 50);
  text("y: "+y, 50, 80);
  if (y >= height-50) {
    //println("y+50");
    R=random(0,255);
    G=random(0,255);
    B=random(0,255);
    dy=-dy;
  } 
  if (y <= 50 && start==false) {
    dy=-dy;
    R=random(0,255);
    G=random(0,255);
    B=random(0,255);
  }
  if (x >= width-50) {
    dx=-dx;
    R=random(0,255);
    G=random(0,255);
    B=random(0,255);
  } 
  if (x <= 50 && start==false) {
    dx=-dx;
    R=random(0,255);
    G=random(0,255);
    B=random(0,255);
  }
  if (x>50&&y>50) {
    start=false;
  }
}
