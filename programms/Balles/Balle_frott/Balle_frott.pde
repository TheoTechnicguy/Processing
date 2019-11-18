//int x = 1;
//int y = 1;
//int step=20;
//float dx = step;
//float dy = step;
//boolean start = true;
//float FF = 1.01;
//float lmx=mouseX;
//float lmy=mouseY;

void setup() {
  size(2000, 1000);
  background(0);
  frameRate(25);
  noStroke();
}

void draw() {
  background(0);
  ellipse(x, y, 50, 50);
  //x+=10;
  //x+=0;
  y+=dy;
  x+=dx;
  dy=dy/FF;
  dx=dx/FF;
  //println(y);
  if (y >= height-50) {
    //println("y+50");
    fill(random(0, 255), random(0, 255), random(0, 255));
    dy=-dy;
    //fill(255,0,0);
    //rect(x,y,25,25);
    //fill(255,255,255);
  } 
  if (y <= 50 && start==false) {
    dy=-dy;
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  if (x >= width-50) {
    dx=-dx;
    fill(random(0, 255), random(0, 255), random(0, 255));
  } 
  if (x <= 50 && start==false) {
    dx=-dx;
    fill(random(0, 255), random(0, 255), random(0, 255));
  }
  //x+=0;
  //y+=dy;
  //println('x', x);
  //println('y', y);
  if (x>50&&y>50) {
    start=false;
  }
  //if (lmx!=mouseX&&dx<1) {
  //  dx=step;
  //  dy=step;
  //  lmx=mouseX;
  //} else if (lmy!=mouseY&&dy<1) {
  //  dx=step;
  //  dy=step;
  //  lmy=mouseY;
  //}
}
