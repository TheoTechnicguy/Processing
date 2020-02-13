// File: mouvement2D
// Autor: Nicolas Fischer
// version: 0.0.0.1
// program: processing
// ext: pde
// ---------------------------------------

// --- init ---
// Funtion repere() changed!
// repere(int quadrillageEnM, float convMEnPi)

float MinPx = 2;

//  Variables
//    Position
float x = 0;
float y = 100;
//float x0 = 0; // unnessesary w/ translate
float y0 = 50;

float angle = 45; // in deg

//    Speed, acceleration & time
float v0 = 40;
float vx0 = v0*sin(radians(angle));
float vy0 = v0*cos(radians(angle));
float a = 9.81;
float t = 0;
float t2 = 0;

//    Other struff
float FPS = 60;
boolean back=false;
boolean stop=false;
//  object specs
float RAY = 25;

//    formula(e)
// x(t) = x*t+x0
// y(t) = (a/2*t*t)+(v*t)+y0

// -- END init ---

// --- setup ---
void setup() {
  size(800, 400);
  background(200);
  frameRate(FPS);
  translate(50, 50);
}
// --- END setup ---

// --- draw ---
void draw() {
  background(200);
  repere(50, MinPx); // Fonction changed!
  x=vx0*t;
  if (run==1){
    
  }
  y=((-a/2)*(pow(t, 2)))+(vy0*t)+y0+y1;

  if (back) {
    t=t-(1/FPS);
  } else {
    t=t+(1/FPS);
  }

  //println(t);

  circle(x*MinPx, -y*MinPx, RAY);
  textSize(20);
  text(x+" m", x*MinPx-RAY/4, -(y*MinPx+RAY/2+5));
  text((t+t2)+" s", width-250, -250);

  if (x!=0 && y<=(RAY/MinPx)) {
    println("Backward");
    back=true;
  }
  //println(back);
  if (back && x<=0) {
    println("forward");
    back=false;
  }
}
// --- END draw ---

void mouseClicked() {
  println(stop);
  if (!stop){
    noLoop();
    stop=true;
  } else if (stop) {
    loop();
    stop=false;
  }
}
