int tps=millis();
double f=1;
for (int i=1; i<=500; i+=1){
  f*=i;
  //print(i, f, "|");
}
println(int(f));
println(f);
println(tps);
