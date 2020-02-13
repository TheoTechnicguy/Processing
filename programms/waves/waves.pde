// File: waves
// Autor: Nicolas Fischer
// version: 1
// program: processing
// ext: pde
// ---------------------------------------

// --- init ---
boolean stop = false;
float y;
float x;
float t;
float T=6;
float lambda=200;
float A=200;

float T2=20;
float lambda2=lambda/2;
float A2=A/5;

//float T2=3;
//float lambda2=220;
//float A2=70;

float FPS=60;

// -- END init ---


// --- setup ---
void setup() {
  frameRate(FPS);
  noFill();
  size(2000, 1000);
}
// --- END setup ---


// --- draw ---
void draw() {
  background(200);
  t+=(1/FPS);
  beginShape();
  for (x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-x/lambda))+A2*sin(2*PI*(t/T2-x/lambda2)))+height/2;
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
