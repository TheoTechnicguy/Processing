int x = 0;
int y = 0;
int step=20;
float dx = step;
float dy = step;
boolean start = true;
float FF = 1.01;
float lmx=mouseX;
float lmy=mouseY;

void setup() {
  size(2000, 1000);
  background(0);
  frameRate(25);
  noStroke();
}

void draw() {
  background(0);
  ellipse(x, y, 50, 50);
  fill(255,255,255);
  rect(width-30,mouseY-50,20,100);
  y+=dy;
  x+=dx;
  if (y >= height-50) {
    dy=-dy;
  } 
  if (y <= 50 && start==false) {
    dy=-dy;
  }
  if (x >= width-50) {
    dx=-dx;
  } 
  if (x <= 50 && start==false) {
    dx=-dx;
  }
  if (x>50&&y>50) {
    start=false;
  }
}
