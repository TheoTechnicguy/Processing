// File: Anim1
// Autor: Nicolas Fischer
// version: 0.0.0.1
// program: processing
// ---------------------------------------

// --- init ---
// Funtion repere changed!
// repere(int quadrillageEnM, float convMEnPi)

//  Variables for MCU
float x = 0;
float y = -200; // !! Y is backwards!
float v = 4;
float t = 0;
float x0 = 0;
float FPS = 25;

//  object specs
float RAY = 25;

// x(t) = x*t+x0

// -- END init ---
void setup() {
  size(800, 400);
  background(200);
  frameRate(FPS);
  translate(50, 50);
}

void draw() {
  background(200);
  repere(50, 2); // Fonction changed!
  x=x0+v*t;
  t=t+(1/FPS);
  //println(t);

  circle(x, y, RAY);
}
