int a = 0; int b = 1; int n=10*99999;

while (a<=n) {
  print(a+" ");
  //print(' ');
  int c=a;
  a=b; 
  b=c+b;
  //b=a+b;
}

println();
println("Done");
