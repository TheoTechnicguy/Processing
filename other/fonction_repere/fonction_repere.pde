//conversion et bordure
int quadrillageEnM=10;
int quadrillage=int(quadrillageEnM*convMEnPi);
//coefficient permettant de positionner la borde à un multiple du quadrillage
int coefBordure=1;
//calcul de la position de la bordure
int offSetX=quadrillage*coefBordure;
int offSetY=quadrillage*coefBordure;

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
