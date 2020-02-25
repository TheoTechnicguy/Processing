// File: onde_stat
// Autor: Nicolas Fischer & Zurong Huang
// version: 0.0.0.1
// program: processing
// ext: pde
// ---------------------------------------

// Notes:


// --- init ---
float A=80;
float F=0.8;
float OMEGA=2*PI*F;
float t;
float T=2*PI/OMEGA;
float y;
float lambda = 200;
float PHI=.31;
int mouse_x;

int stop = 0;
boolean inited=false;
float FPS=60;

// -- END init ---

void setup_run() {
  textSize(30);
  stroke(255);

  for (int x=0; x<5; x+=1) {
    background(0);
    text("Initializing", 0, 30);

    for (int i=0; i<3; i+=1) {
      text(".", 150+i*10, 30);
      //delay(1000);
    }
  }
  delay(5000);
}

// --- setup ---
void setup() {
  frameRate(FPS);
  size(1000, 600);
  noFill();
}
// --- END setup ---

// --- draw ---
void draw() {
  //if (!inited) {
  //setup_run();
  //}
  //inited=true;

  background(255);

  // --- Repere ---
  stroke(0);
  strokeWeight(5);

  // X-Axis
  line(0, height/2, width, height/2);
  // Y-Axis
  line(lambda, 0, lambda, height);

  // X-Axis grid
  strokeWeight(1);
  for (float x=0; x<=height; x+=0.5) {
    line(lambda*x, 0, lambda*x, height);
  }

  // Y-Axis grid
  for (float x=0; x<=width; x+=0.5) {
    line(0, lambda*x, width, lambda*x);
  }

  translate(lambda, height/2);

  textSize(20);
  fill(0);

  // X-Axis graduation
  for (float x=0; x<=width; x+=0.5) {
    text(int(x*20), x*lambda+5, 25);
  }
  // X-Axis Title
  text("x (cm)", width-263, -8);

  // Y-Axis graduation
  for (float x=-height/2; x<=height; x+=0.5) {
    if (int(-x*100)!=0) {
      text(int(-x*100), 5, x*lambda-5);
    }
  }
  // X-Axis Title
  text("y (cm)", 5, -((height/lambda)/2)*lambda+15);
  //println(((height/lambda)/2)*lambda);

  noFill();
  strokeWeight(1);
  // --- end Repere ---

  // --- Frenel ---
  stroke(0);
  ellipse(-lambda/2, 0, lambda, lambda);
  // lambda = 1/2 turn
  //println(OMEGA*t);
  stroke(0, 255, 127);

  line(-lambda/2, 0, sin(OMEGA*(t+PHI))*(lambda/2)-lambda/2, cos(OMEGA*(t+PHI))*(lambda/2));
  //println(sin(OMEGA*(t+PHI))*(lambda/2));


  // --- end Frenel ---

  // progressive wave L-R
  stroke(255, 0, 0);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-x/lambda)));//+height/2;
    vertex(x, y);
    if (stop==1 && x==mouseX && mouseX > lambda) {
      fill(255, 0, 0);
      circle(x-lambda, y, 10); 
      noFill();
      text(-y, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*2);
    }
  }
  endShape();

  // progressive wave R-L
  stroke(127, 0, 127);
  beginShape();
  for (int x=width; x>=0; x-=1) {
    y=-(A*sin(2*PI*(t/T+x/lambda)));//height/2;
    vertex(x, y);

    if (stop==1 && x==mouseX && mouseX > lambda) {
      fill(127, 0, 127);
      circle(x-lambda, y, 10); 
      noFill();
      text(-y, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*3);
    }
  }
  endShape();

  // stationnary wave L-R
  stroke(0, 0, 255);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-(x+lambda/4)/lambda))+A*sin(2*PI*(t/T+(x+lambda/4)/lambda)));//+height/2;
    //line(-lambda/2, 0, x-3*lambda, y);
    vertex(x, y);

    if (stop==1 && x==mouseX && mouseX > lambda) {
      fill(0, 0, 255);
      circle(x-lambda, y, 10); 
      noFill();
      text(-y, mouseX+10-lambda, -((height/lambda)/2)*lambda+18);
    }
  }
  endShape();

  if (stop==1 && mouseX > lambda) {
    stroke(0);
    line(mouseX-lambda, -3*lambda, mouseX-lambda, height);
  }
  if (stop==0) {
    t=t+(1/FPS);
  } else if (stop==2) {
    if (mouseX<mouse_x) {
      t-=(mouse_x-mouseX)/10;
      println(mouse_x-mouseX);
      mouse_x=mouseX;
    } else if (mouseX>mouse_x) {
      t+=(mouseX-mouse_x)/10;
      mouse_x=mouseX;
    }
  }
  //noLoop();
  println(t);
  println(mouseX);
}
// --- END draw ---


// --- mouseClicked ---
void mouseClicked() {
  if (stop==0) {
    stop=1;
  } else if (stop==1) {
    stop=2;
    mouse_x=mouseX;
  } else if (stop==2) {
    stop=0;
  }
}
// --- END mouseClicked ---
