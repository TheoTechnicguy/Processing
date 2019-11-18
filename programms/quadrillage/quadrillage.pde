size(2500,1400);
translate(width/2,height/2);
background(255);
//frameRate(30);
int spaceing = 30;

for (int i=0;i<=width;i+=spaceing){
  for (int j=0;j<=height;j+=spaceing){
    noFill();
    rect(i,j,spaceing,spaceing);
  }
}
strokeWeight(2.5);
line(0,height/2,width,height/2);
line(width/2,0,width/2,height);

//for (int ii=0; ii<=1000; ii+=1){
//  point(mouseX,mouseY);
//  delay(500);
//}

point(mouseX,mouseY);
