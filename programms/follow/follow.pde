boolean init=true;
  int x=width/2;
  int y=height/2;
int step=10;
boolean erase=false;
boolean randcol=true;

void setup(){
  size(2000,1400);
  background(0);
  frameRate(1000);
  noStroke();
  //fill(255,0,0);
  //rect(x,y,50,50);
}

void draw(){
  if (init){
  int x=width/2;
  int y=height/2;
  init=false;}
  //while (x!=mouseX&&y!=mouseY){
  //  fill(0);
  //  rect(0,0,width,height);
  //  fill(255,0,0);
  //  rect(x,y,50,50);
  //  x+=1;
  //  y+=1;
  //  delay(500);
  //}
  if (erase){
  fill(0,0,0);
  rect(0,0,width,height);
  }
  if (randcol) {
    fill(random(255),random(255),random(255));
  } else {fill(255,0,0);}
  //delay(500);
  
  rect(x,y,50,50);
  if (x>mouseX){
    if (x>mouseX+step){x-=step;}
    else{x-=1;}
  } else if (x<mouseX) {
    if (x<mouseX+step){x+=step;}
    else{x+=1;}
  }
  
  if (y>mouseY){
    if (y>mouseY+step){y-=step;}
    else{y-=1;}
  } else if (y<mouseY) {
    if (y<mouseY+step){y+=step;}
    else{y+=1;}
  }
  if (x==mouseX&&y==mouseY){
    fill(0,255,0);
    rect(x,y,50,50);
  }
  

}
