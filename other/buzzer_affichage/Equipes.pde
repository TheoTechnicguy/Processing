
class Equipes {
  int pasX=width/10-20;
  int posX=pasX-30;
  int posY=height-height/7-10;
  ArrayList<Etiquette> joueurs = new ArrayList<Etiquette>();
  Equipes() {
    for (int i=0; i<listeJoueurs.length; i++) {
      String nom=listeJoueurs[i].getChild("nom").getContent();
      String ref=listeJoueurs[i].getChild("ref").getContent();
      joueurs.add(new Etiquette(nom, ref, posX, posY));
      posX=posX+pasX+10;
    }
  }
  void dessin() {
    for (Etiquette E : joueurs) {
      E.dessiner();
    }
  }
  void changerCouleur(String message) {
    String recu=message.substring(0, 2);
    for (Etiquette E : joueurs) {
      if (E.ref.equals(hm.get(recu))) {
        if (message.substring(2).equals("H")) {
          E.couleur=vert;
          if (E.ref.substring(0, 1).equals("R")&& son) {
            sonRouge();
          } else if (E.ref.substring(0, 1).equals("N")&& son){
            sonNoir();
          }
        } else if (message.substring(2).equals("L")) {
          if (E.ref.substring(0, 1).equals("R")) {
            E.couleur=rouge;
          } else {
            E.couleur=noir;
          }
        }
      } else if (recu.equals("XX")) {

        if (E.ref.substring(0, 1).equals("R")) {
          E.couleur=rouge;
        } else {
          E.couleur=noir;
        }
      }
    }
  }
}
