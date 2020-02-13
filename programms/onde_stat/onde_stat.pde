// File: onde_stat
// Autor: Nicolas Fischer & Zurong Huang
// version: 0.0.0.1
// program: processing
// ext: pde
// ---------------------------------------

// --- init ---
float A=80;
float F=0.8;
float OMEGA=2*PI*F;
float t;
float T=2*PI/OMEGA;
float y;
float lambda = 200;

boolean stop = false;
float FPS=60;

// -- END init ---


// --- setup ---
void setup() {
  frameRate(FPS);
  size(2000, 1000);
  noFill();
}
// --- END setup ---


// --- draw ---
void draw() {
  background(200);
  t=t+(1/FPS);
  println("t:"+t);
  println("FPS:"+FPS);
  println("1/:"+1/FPS);
  println("t+:"+t+1/FPS);

  // progressive wave L-R
  stroke(255, 0, 0);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-x/lambda)))+height/2;
    vertex(x, y);
    //point(x,y);
  }
  endShape();

  // progressive wave R-L
  stroke(0, 255, 0);
  beginShape();
  for (int x=0; x==width; x=x+1) {
    y=(-A*sin(2*PI*(t/T-x/lambda)))+height/2;
    vertex(x, y);
    //point(x,y);
  }
  endShape();

  // stationnary wave L-R
  stroke(0, 0, 255);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(-A*sin(2*PI*(t/T-(x+lambda/4)/lambda))+A*sin(2*PI*(t/T-(x+lambda/4)/lambda)))+height/2;
    vertex(x, y);
    //point(x,y);
  }
  endShape();
}
// --- END draw ---


// --- mouseClicked ---
void mouseClicked() {
  if (!stop) {
    noLoop();
    stop=true;
  } else if (stop) {
    loop();
    stop=false;
  }
}
// --- END mouseClicked ---
