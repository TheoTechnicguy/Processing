
void setup(){
  size(2000,1000);
  
  background(0);
  noStroke();
  frameRate(5000);

}

void draw(){
  //delay(1000);
  //fill(255,0,0);
  //rect(0,0,50,50);
  translate(width/4,height/2);
  for (int i=0;i<=255;i+=1){
    fill(255,i/2);
    ellipse(0+2*i,0,50,50);
  }
  
  delay(4000);
  
  //fill(0);
  //rect(-50,-50,700,100);
  
  //for (int i=0;i<=255;i+=1){
  //  fill(0,i/2);
  //  ellipse(0+2*i,0,50,50);
  //}
  //delay(5000);
  //fill(100);
  //for (int i=0;i<=255;i+=1){
    //fill(100,i/2);
    //ellipse(0+2*i,0,50,50);
  //}
  //fill(0);
  //delay(5000);
  //for (int i=0;i<=255;i+=1){
  //  fill(0,i/2);
  //  ellipse(0+2*i,0,50,50);
  //}
  //delay(500);
  //fill(255);
  //for (int i=0;i<=255;i+=1){
  //  fill(255,i/2);
  //  ellipse(0+2*i,0,50,50);
  //}
}

void end() {
  delay(50000);}
