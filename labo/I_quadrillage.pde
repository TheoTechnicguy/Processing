size(400, 600);

for (int x=0; x<width; x=x+10) {
  for (int y=0; y<height; y=y+10) {
    
    line(x,0,x,height);
    line(0,y,width,y);
  }
}
