//Variables cinématiques
float temps=0;
float vitesseX=20;
float positionX=0;
float accelerationX=0;

//conversion et bordure
float convMEnPi=2;
int quadrillage=50;
//coefficient permettant de positionner la borde à un multiple du quadrillage
int coefBordure=1;
//calcul de la position de la bordure
int offSetX=quadrillage*coefBordure;
int offSetY=quadrillage*coefBordure;


void setup() {
  frameRate(25);
  size(800, 400);
}

void draw() {
  background(255); 
  repere();
  textSize(20);
  fill(0, 200, 100);
  noStroke();
  rectMode(CORNER);
  rect(490, height-380, 250, 90);
  stroke(1);
  fill(0);
  text("t = " +temps + " s", 500, height-350);
  text("position = " +(positionX)+ " m", 500, height-325);
  text("vitesse = " +(vitesseX)+ " m/s", 500, height-300);
  textSize(12);
  println(vitesseX/frameRate);
  println("frameRate : " +frameRate);
  positionX=positionX+(vitesseX/frameRate);
  vitesseX=vitesseX+accelerationX/frameRate;
  temps=temps+1/frameRate;
  fill(200, 0, 0);
  ellipse(offSetX+positionX*convMEnPi, height-offSetY-100*convMEnPi, 10, 10);
}
void repere() {
  strokeWeight(1);

  for (int x=0; x<=width; x=x+quadrillage) {
    for (int y=0; y<=height; y=y+quadrillage) {

      line(x, 0, x, height);
      line(0, y, width, y);
      fill(0);
      text(int(x/convMEnPi), x+offSetX+5, height-offSetX+20);
      text(int(y/convMEnPi), offSetY-25, height-offSetY-y-3);
    }
  }
  strokeWeight(5);
  line(offSetX, 0, offSetX, height);
  line(0, height-offSetY, width, height-offSetY);
  strokeWeight(1);
}
void mousePressed() {
  noLoop();
}
void mouseReleased() {
  loop();
}
