int quad=50;
size(400,400);
//coefficient permettant de positionner la borde à un multiple du quadrillage
int coefBordure=1;
//calcul de la position de la bordure
int offSetX=quad*coefBordure;
int offSetY=quad*coefBordure;

strokeWeight(1);

for (int x=0; x<=width; x=x+quad) {
  for (int y=0; y<=height; y=y+quad) {
    
    line(x, 0, x, height);
    line(0, y, width, y);
    fill(0);
    text(x, x+offSetX+5, height-offSetX+20);
    text(y, offSetY-25, height-offSetY-y-3);
  }
}
strokeWeight(5);
line(offSetX, 0, offSetX, height);
line(0, height-offSetY, width, height-offSetY);
