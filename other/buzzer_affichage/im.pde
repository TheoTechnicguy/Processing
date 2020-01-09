String nomFichier(int n) {
  return "images/Diapositive"+n+".JPG";
}
PImage chargerImage(int n) {
  image = loadImage(nomFichier(n));
  return image;
}
int numA(int n) {
  int nn=(nbreImages+n-1)%nbreImages;

  return nn;
}
int numB(int n) {
  int nn=(n)%nbreImages;
  return nn;
}
int numC(int n) {
  int nn=(n+1)%nbreImages;

  return nn;
}
