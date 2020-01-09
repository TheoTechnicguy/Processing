//Variables cinématiques
float temps=0;
float vinit=30;
float angle=45;
//axe X
float vitesseX=vinit*cos(radians(angle));
float positionX=0;
float accelerationX=0;
//axe Y
float vitesseY=vinit*sin(radians(angle));
float positionY=0;
float accelerationY=-9.81;


//conversion et bordure
float convMEnPi=10;
int quadrillage=100;
//coefficient permettant de positionner la borde à un multiple du quadrillage
int coefBordure=1;
//calcul de la position de la bordure
int offSetX=quadrillage*coefBordure;
int offSetY=quadrillage*coefBordure;


void setup() {
  frameRate(25);
  size(1100, 500);
}

void draw() {
  if (positionY<0) {
    noLoop();
  }
  background(255); 
  repere();

  //affichage***********************
  textSize(20);
  fill(0, 200, 100);
  noStroke();
  rectMode(CORNER);
  rect(280, height-480, 600, 90);
  stroke(1);
  fill(0);
  text("t = " +temps + " s", 300, height-450);
  text("positionX = " +(positionX)+ " m", 300, height-425);
  text("vitesseX = " +(vitesseX)+ " m/s", 300, height-400);
  text("positionY = " +(positionY)+ " m", 600, height-425);
  text("vitesseY = " +(vitesseY)+ " m/s", 600, height-400);
  textSize(12);
  println(vitesseX/frameRate);
  println("frameRate : " +frameRate);

  //calculs cinématiques
  positionX=positionX+(vitesseX/frameRate);
  vitesseX=vitesseX+accelerationX/frameRate;

  positionY=positionY+(vitesseY/frameRate);
  vitesseY=vitesseY+accelerationY/frameRate;

  temps=temps+1/frameRate;
  fill(200, 0, 0);
  ellipse(offSetX+positionX*convMEnPi, height-offSetY-positionY*convMEnPi, 10, 10);
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
