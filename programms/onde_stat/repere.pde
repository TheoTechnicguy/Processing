// File: repere
// Author: Bruno Vanden Broek
// Edited by: Nicolas Fischer
// version: 1
// ext: pde
// --------------------------

void repere(float quadrillageEnM, float convMEnPi) {
  /*
  Code from Bruno Van Denbroek
   
  Fonction repere
  arguments: quadrillageEnM (int), convMEnPi (float)
  */

  //conversion et bordure
  int quadrillage=int(quadrillageEnM*convMEnPi);
  //coefficient permettant de positionner la borde à un multiple du quadrillage
  int coefBordure=1;
  //calcul de la position de la bordure
  int OFFSET_X=quadrillage*coefBordure;
  int OFFSET_Y=quadrillage*coefBordure;

  strokeWeight(1);

  for (int x=0; x<=width; x+=quadrillage) {
    for (int y=0; y<=height; y+=quadrillage) {

      line(x, 0, x, height);
      line(0, y, width, y);
      fill(0);
      text(int(x/convMEnPi), x+OFFSET_X+5, height-OFFSET_X+20);
      text(int(y/convMEnPi), OFFSET_Y-25, height-OFFSET_Y-y-3);
    }
  }
  strokeWeight(5);
  line(OFFSET_X, 0, OFFSET_X, height);
  line(0, height-OFFSET_Y, width, height-OFFSET_Y);
  strokeWeight(1);
  translate(OFFSET_X, height-OFFSET_Y);
  //println(OFFSET_X);
  //println("Y: "+OFFSET_Y);
}
