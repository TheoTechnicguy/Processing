
//!!!!!!!!!!!!!!!!!!! réactiver les sérials
import processing.serial.*;
import java.util.Map;
import java.io.*;
import java.lang.*;
import controlP5.*;
import processing.sound.*;



SqrOsc sin = new SqrOsc(this);
int dureeSon=200;
ControlP5 cp5;

Boolean son=true;
int i = 0;
PImage monImageA;
PImage monImageB;
PImage monImageC;
PImage image;
PImage fondIm;
int nbreImages;
color rouge=color(139, 0, 0);
color vert=color(154, 205, 50);
color noir=color(0);
color fond=color(150);
XML FichierJoueurs;
XML[] listeJoueurs;
XML fichier_score;
XML[] scores;
XML lastScore;
XML newScore;
XML scoreR;
XML scoreN;
String lastDate;
String date=day()+"/"+month()+"/"+year();
Etiquette et;
Serial Serial;
int tailleX;
int tailleY;
Equipes Affichage;
int scoreRouge=0;
int scoreNoir=0;
HashMap<String, String> hm;


void setup() {
  fichier_score=loadXML("/datas/fichier_score.xml");
  scores=fichier_score.getChildren("Score");
  lastScore=scores[scores.length-1];
  lastDate=lastScore.getChild("date").getContent();
  if (lastDate.equals(date)) {
    scoreRouge=int(lastScore.getChild("rouge").getContent());
    scoreNoir=int(lastScore.getChild("noir").getContent());
  } else {
    newScore=new XML("Score");
    newScore.addChild("date").setContent(date);
    scoreR=newScore.addChild("rouge");
    scoreN=newScore.addChild("noir");
    fichier_score.addChild(newScore);
    saveXML(fichier_score, "/datas/fichier_score.xml");
    scores=fichier_score.getChildren("Score");
    lastScore=scores[scores.length-1];
  }

  cp5 = new ControlP5(this);
  cp5.addButton("moinsR")
    .setCaptionLabel("MOINS")
    .setPosition(65, height/2+80)
    .setSize(50, 20);
  cp5.addButton("plusR")
    .setCaptionLabel("PLUS")
    .setPosition(165, height/2+80)
    .setSize(50, 20);
  cp5.addButton("moinsN")
    .setCaptionLabel("MOINS")
    .setPosition(width-215, height/2+80)
    .setSize(50, 20);
  cp5.addButton("plusN")
    .setCaptionLabel("PLUS")
    .setPosition(width-115, height/2+80)
    .setSize(50, 20);
  cp5.addButton("moinsQ")
    .setCaptionLabel("MOINS")
    .setPosition(width/2-65, height-2*height/7+10)
    .setSize(50, 20);
  cp5.addButton("plusQ")
    .setCaptionLabel("PLUS")
    .setPosition(width/2+15, height-2*height/7+10)
    .setSize(50, 20);
  cp5.addButton("reset")
    .setCaptionLabel("RESET IMAGES")
    .setPosition(width/2-40, height-2*height/7+35)
    .setSize(80, 20);  
  cp5.addButton("resetPoints")
    .setCaptionLabel("RESET SCORES")
    .setPosition(width/2-40, height-height/7+80)
    .setSize(80, 20); 

  hm = new HashMap<String, String>();
  hm.put("R1", "Rouge1");
  hm.put("R2", "Rouge2");
  hm.put("R3", "Rouge3");
  hm.put("R4", "Rouge4");
  hm.put("R5", "Rouge5");

  hm.put("N1", "Noir1");
  hm.put("N2", "Noir2");
  hm.put("N3", "Noir3");
  hm.put("N4", "Noir4");
  hm.put("N5", "Noir5");
  rectMode(CENTER);
  FichierJoueurs=loadXML("listeJoueurs.xml");
  listeJoueurs=FichierJoueurs.getChildren("joueur");
  //println(listeJoueurs.length);
  size(displayWidth, displayHeight);
  tailleX=(width/10-30);
  tailleY=height*1/7;

  Affichage=new Equipes();
  //println("ok");
  //Serial=new Serial(this, Serial.list()[0], 57600);
  //Serial.bufferUntil('\n');
  background(fond);
  textAlign(CENTER, CENTER);
  textSize(25);

  // imageeees/////////////
  File f=new File(dataPath(sketchPath()+"/images"));
  String[] fileNames=f.list();
  nbreImages=fileNames.length;
  monImageA=chargerImage(numA(i));

  monImageC=chargerImage(numC(i));
  imageMode(CENTER);
  fondIm=createImage(monImageC.width, monImageC.height, RGB);
  for (int i = 0; i < fondIm.pixels.length; i++) {
    fondIm.pixels[i] = color(fond);
  }
  fondIm.save("/images/Diapositive0.JPG");
  monImageB=chargerImage(numB(i));
}
void draw() {
  background(fond);
  Affichage.dessin();
  image(monImageB, width/2, height/2-height/7);
  score();
}

void serialEvent(Serial Serial) {
  String inString=Serial.readStringUntil('\n');
  if (inString != null) {
    inString = trim(inString);
    Affichage.changerCouleur(inString);
    //println(inString);
    Serial.clear();
  }
}
void keyPressed() {

  if (key == ENTER) {
    //Serial.write("E");
    son=true;
  }
  //images!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!////
  else if (key == 'z') {
    i=(i+1)%nbreImages;
    monImageA=monImageB;
    monImageB=monImageC;
    monImageC=chargerImage(numC(i));
    //Serial.write("E");
  } else if (key == 's') {
    i=(nbreImages+i-1)%nbreImages;
    monImageC=monImageB;
    monImageB=monImageA;
    monImageA=chargerImage(numA(i));
    //Serial.write("E");
  } else if (key == 'e') {
    scoreRouge=scoreRouge+1;
    sauvegarde();
  } else if (key == 'd') {
    scoreRouge=scoreRouge-1;
    sauvegarde();
  } else if (key == 'r') {
    scoreNoir=scoreNoir+1;
    sauvegarde();
  } else if (key == 'f') {
    scoreNoir=scoreNoir-1;
    sauvegarde();
  } else {
    //Serial.write(key);
    son=false;
  }
}
public void controlEvent(ControlEvent theEvent) {
  String nomBouton=theEvent.getController().getName();

  if (nomBouton=="plusR") {
    scoreRouge=scoreRouge+1;
    sauvegarde();
  } else if (nomBouton=="moinsR") {
    scoreRouge=scoreRouge-1;
    sauvegarde();
  } else if (nomBouton=="plusN") {
    scoreNoir=scoreNoir+1;
    sauvegarde();
  } else if (nomBouton=="plusN") {
    scoreNoir=scoreNoir+1;
    sauvegarde();
  } else if (nomBouton=="moinsN") {
    scoreNoir=scoreNoir-1;
    sauvegarde();
  } else if (nomBouton=="resetPoints") {
    scoreNoir=0;
    scoreRouge=0;
    sauvegarde();
  } else if (nomBouton=="reset") {
    Serial.write("E");
    i=0;
    monImageA=chargerImage(numA(i));
    monImageB=chargerImage(numB(i));
    monImageC=chargerImage(numC(i));
  } else if (nomBouton=="plusQ") {
    Serial.write("E");
    i=(i+1)%nbreImages;
    monImageA=monImageB;
    monImageB=monImageC;
    monImageC=chargerImage(numC(i));
  } else if (nomBouton=="moinsQ") {
    Serial.write("E");
    i=(nbreImages+i-1)%nbreImages;
    monImageC=monImageB;
    monImageB=monImageA;
    monImageA=chargerImage(numA(i));
  }
} 
void sauvegarde() {
  //Serial.write("E");
  lastScore.getChild("rouge").setContent(str(scoreRouge));
  lastScore.getChild("noir").setContent(str(scoreNoir));
  saveXML(fichier_score, "/datas/fichier_score.xml");
}
