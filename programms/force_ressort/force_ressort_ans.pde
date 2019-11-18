float ans=0;
float k = 10;
float dx=0.01;

for (float x=0; x<=0.1; x+=dx){
  ans+=k*x*dx;
}
println(ans);
