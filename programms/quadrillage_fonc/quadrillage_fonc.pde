
void setup() {
  size(1000, 1000);
  background(255);
  graph(50, "Time","Y");
}

void graph(int spaceing, String X_name, String Y_name) {
  /*
  Function graph
  arguments: spaceing (int), X_name (str), Y_name (str)
  
  Draws axis through out the window accoding to /spacing/
  line = thin lines running accros the window
  axis = graduation axis
  labeling = numbering of the lines
  */
  
  // Lines
  //  Y-lines (Horizontal)
  for (int i=0; i<=height; i+=spaceing) {
    line(0, i, width, i);
  }
  //  X-lines (Vertical)
  for (int i=0; i<=width; i+=spaceing) {
    line(i, 0, i, height);
  }
  
  // Axis
  //  Setup
  strokeWeight(2.5);
  //  Y-axis
  translate(spaceing, 0);
  line(0, 0, 0, height);

  // X-axis
  int x_axis = round(height/spaceing); // Draws X-axis on last X-line
  if (x_axis*spaceing==height) { // if last x-line out of window, get the before-last
    x_axis-=1;
  }
  translate(0, spaceing*x_axis);
  line(-spaceing, 0, width, 0);

  // Labeling
  //  Setup
  fill(0);
  textSize(11);
  
  //  Y-axis labeling
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
  
  //  Y-axis name
  text(Y_name, 5, 12.5-i_out+spaceing);

  //  X-axis labeling
  i_out=0;
  for (int i=spaceing; i<=width; i+=spaceing) {
    text(i, 5+i, 15);
    i_out=i;
  }
  
  //  X-axis name
  text(X_name, i_out-spaceing*2+5, -5);
}
