size(0,0);
int x=100;
int y=200;
int z=1;

while (x<200 || y<300 && z!=1){
  println("while");
  y+=5;
  x+=2;
}
println("out on");
if (x>200){
  print("x");
} else if (y>300){
  print("y");
}
