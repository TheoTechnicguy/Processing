//constante de raideur d'un ressort en N/m
float k=10;
//Distance en m
float d=0.1;
//incrément
float deltaX=0.000001;
//énergie potentielle
float energie=0;

for (float x=0; x<d; x=x+deltaX) {
  energie=energie+k*x*deltaX;
  //println(energie);
}
println(energie);
