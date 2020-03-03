// File: onde_stat
// Autor: Nicolas Fischer & Zurong Huang
// version: 1.0.0.1
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
int mouse_x;
float ymax;

int stop = 0;
boolean inited=false;
float FPS=60;

// -- END init ---

// --- setup ---
void setup() {
  frameRate(FPS);
  size(1000, 600);
  noFill();
}
// --- END setup ---

// --- draw ---
void draw() {
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
  for (float x=-height/2; x<=height; x+=.5) {
    if (int(-x*20)!=0) {
      text(int(-x*20), 5, x*lambda-5);
    }
  }
  // X-Axis Title
  text("y (cm) max:", 5, -((height/lambda)/2)*lambda+15);

  noFill();
  strokeWeight(1);
  // --- end Repere ---

  // --- Frenel ---
  circle(-lambda/2, 0, lambda);
  strokeWeight(2);
  stroke(0, 153, 51);

  line(-lambda/2, 0, sin(OMEGA*(t+PI/2))*(lambda/2)-lambda/2, cos(OMEGA*(t+PI/2))*(lambda/2));
  // --- end Frenel ---

  // progressive wave L-R
  strokeWeight(1);
  stroke(255, 0, 0);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-x/lambda)));//+height/2;
    vertex(x, y);
    if (stop==1 && x==mouseX && mouseX > lambda) {
      fill(255, 0, 0);
      circle(x-lambda, y, 10); 
      noFill();
      if (mouseX<390) {
        text(-y/10, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*3);
      } else if (mouseX+10-lambda < width-1.5*lambda) {
        text(-y/10, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*2);
      } else {
        text(-y/10, mouseX+10-1.5*lambda, -((height/lambda)/2)*lambda+18*2);
      }
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
      if (mouseX<390) {
        text(-y/10, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*4);
      } else if (mouseX+10-lambda < width-1.5*lambda) {
        text(-y/10, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*3);
      } else {
        text(-y/10, mouseX+10-1.5*lambda, -((height/lambda)/2)*lambda+18*3);
      }
    }
  }
  endShape();

  // stationnary wave L-R
  stroke(0, 0, 255);
  beginShape();
  for (int x=0; x<width; x+=1) {
    y=(A*sin(2*PI*(t/T-(x+lambda/4)/lambda))+A*sin(2*PI*(t/T+(x+lambda/4)/lambda)));//+height/2;
    vertex(x, y);

    // get ymax of current shape
    if (y>ymax) {
      ymax=y;
    }

    if (stop==1 && x==mouseX && mouseX > lambda) {
      fill(0, 0, 255);
      circle(x-lambda, y, 10); 
      noFill();
      if (mouseX<390) {
        text(-y/10, mouseX+10-lambda, -((height/lambda)/2)*lambda+18*2);
      } else if (mouseX+10-lambda < width-1.5*lambda) {
        text(-y/10, mouseX+10-lambda, -((height/lambda)/2)*lambda+18);
      } else {
        text(-y/10, mouseX+10-1.5*lambda, -((height/lambda)/2)*lambda+18);
      }
    }
  }
  endShape();
  // print ymax & reset
  text(ymax/10, 115, -((height/lambda)/2)*lambda+15);
  ymax=0;

  if (stop==1 && mouseX > lambda) {
    stroke(0);
    line(mouseX-lambda, -3*lambda, mouseX-lambda, height);
  }
  if (stop==0) {
    t=t+(1/FPS);
  } else if (stop==2) {
    if (mouseX<mouse_x) {
      t-=(mouse_x-mouseX)/FPS;
      mouse_x=mouseX;
    } else if (mouseX>mouse_x) {
      t+=(mouseX-mouse_x)/FPS;
      mouse_x=mouseX;
    }
  }
  //noLoop();
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
