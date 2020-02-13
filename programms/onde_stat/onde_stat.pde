// File: onde_stat
// Autor: Nicolas Fischer & Zurong Huang
// version: 0.0.0.1
// program: processing
// ext: pde
// ---------------------------------------

// --- init ---
boolean stop = false;
int FPS=60;

// -- END init ---


// --- setup ---
void setup() {
  frameRate(FPS);
  size(1000,2000);
}
// --- END setup ---


// --- draw ---
void draw() {
  background(200);
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
