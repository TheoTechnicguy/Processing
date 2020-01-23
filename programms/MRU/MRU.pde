// File: MRU
// Autor: Nicolas Fischer
// version: 0.0.0.1
// program: processing
// ext: pde
// ---------------------------------------

// --- init ---
// Funtion repere() changed!
// repere(int quadrillageEnM, float convMEnPi)

float MinPx = 2;

//  Variables for MCU
float x = 0;
float y = 100;
float v = 4;
float t = 0;
//float x0 = 0; // unnessesary w/ translate
float FPS = 25;

//  object specs
float RAY = 25;

// x(t) = x*t+x0

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
  x=v*t;
  t=t+(1/FPS);
  //println(t);

  circle(x*MinPx, -y*MinPx, RAY);
  textSize(20);
  text(x+" m", x*MinPx-RAY/4,-(y*MinPx+RAY/2+5));
  text(t+" s", width-250, -250);
}
// --- END draw ---
