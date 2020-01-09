
class Etiquette {

  String ref;
  String nom;
  int xpos;
  int ypos;
  color couleur;

  Etiquette(String n, String r, int X, int Y) {
    nom=n;
    ref=r;
    xpos=X;
    ypos=Y;
    if (r.substring(0, 1).equals("R")) {
      couleur=rouge;
    } else {
      couleur=noir;
    }
  }
  void dessiner() {
    stroke(255);
    strokeWeight(2);
    fill(couleur);
    rect(xpos, ypos, tailleX, tailleY);
    fill(255);
    text(nom,xpos,ypos+10);
    fill(fond);
  }
}
