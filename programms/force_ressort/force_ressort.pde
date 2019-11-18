int k=10;
//int x=0;
double w=0;

for (float x=0; x<=0.1; x+=0.01){
  w+=k*x*0.01;
  println(x, k*x, w);
  //println(x);
}
println();
println("Sol: "+w);
