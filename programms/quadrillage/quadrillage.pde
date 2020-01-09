size(570, 1600);
background(255);
int spaceing = 50;

//for (int i=0; i<=width; i+=spaceing) {
//  for (int j=0; j<=height; j+=spaceing) {
//    noFill();
//    rect(i, j, spaceing, spaceing);
//  }
//strokeWeight(1);
for (int i=0; i<=height; i+=spaceing){
  line(0,i,width,i);
}
for (int i=0; i<=width; i+=spaceing){
  line(i,0,i,height);
}
// Axis
strokeWeight(2.5);
// Y-axis
translate(spaceing, 0);
line(0, 0, 0, height);

// X-axis
int x_axis = round(height/spaceing);
if (x_axis*spaceing==height){
  x_axis-=1;
}
translate(0, spaceing*x_axis);
line(-spaceing, 0, width, 0);

// Labeling
fill(0);
textSize(11);
// Y-labeling
float indent = 0;
float i_out=0;
for (int i=0; i<=height; i+=spaceing) {
  if (i<10) {
    indent=15;
  } else if (i>=10&&i<100) {
    indent=7.5;
  } else if (i>=100&&i<1000) {
    indent=0;
  }
  text(i, -25+indent, 12.5-i);
  i_out = i;
}
//println(-i_out+spaceing);
text("Y",5,12.5-i_out+spaceing);
//rect(0,0,10,10);

// X-labeling
i_out=0;
for (int i=spaceing; i<=width; i+=spaceing) {
  text(i, 5+i, 15);
  i_out=i;
}
text("X",i_out-spaceing-10,15);
