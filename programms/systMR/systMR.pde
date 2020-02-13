// File: systMR
// Autor: Nicolas Fischer
// version: 0.0.0.1
// program: processing
// ext: pde
// ---------------------------------------

// --- init ---
float y;
float A = 100;
float omg;
float t;
float phi;
float k=1;
float m=1;

float FPS = 60;
float RAY = 30;

// -- END init ---

// --- setup ---
void setup(){
  omg=pow(k/m,0.5);
  size(800,600);
  frameRate(FPS);
}
// --- END setup ---

// --- draw ---
void draw(){
  background(200);
  t+=(FPS);
  y=A*sin(omg*t+phi);
  line(width/2, 0, width/2, y+height/2);
  circle(width/2,y+height/2,RAY);
}
// --- END draw ---
