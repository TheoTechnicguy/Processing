//variables:
Float A=8.0;
Float L=60.0;
Float x;
Float lambda=15.0;
Float omega= 2*PI;
Float f=1.0;
Float y;
float t;
float T=2*PI/omega;



void setup () {
  frameRate (60);
  size (800, 800);
  noFill();
}

void draw () {
  background (155);

  //Repere
  stroke(0);
  strokeWeight(5);

  //axe X
  line(1, height/2, width, height/2);
  //axe y
  line(-1, 1, -1, height);

  // grillage axe X
  strokeWeight(1);
  for (float x=0; x<=width; x+=1) {
    line(100*x, 0, 100*x, height);
  }

  //grillage axe Y
  strokeWeight(1);
  for (float x=0; x<=height; x+=1) {
    line (0, 100*x, width, 100*x);
  }

  translate (0, height/2);

  textSize(15);
  fill(0);

  // graduation de l'axe X
  for (float x=0; x<=width; x+=10) {
    text (int(x*1), x*10, 25);
  }
  //titre de l'axe X
  text("x (cm)", width-70, -8);

  //titre de l'axe Y
  text("y (cm)", 0, -380);

  noFill();
  strokeWeight(1);
  //fin du repère

  t=t+(1/frameRate);

  //onde progressive 1
  stroke (255, 0, 0);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-x/lambda)));
    vertex(x, y);
  } 
  endShape();

  //onde progressive 2
  stroke (0, 255, 0);
  beginShape();
  for (int x=width; x>=0; x-=1) {
    y=(A*sin(2*PI*(t/T+x/lambda)));
    vertex(x, y);
  }
  endShape();

  // onde stationnaire
  stroke(0, 0, 255);
  beginShape();
  for (int x=0; x<800; x+=1) {
    y=(A*sin(2*PI*(t/T-(x+lambda/4)/lambda))+A*sin(2*PI*(t/T+(x+lambda/4)/lambda)));
    vertex(x, y);
  }
  endShape();
}
