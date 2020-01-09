void score() {
  pushMatrix();
  textAlign(CENTER, CENTER);
  textSize(50);
  rectMode(CENTER);
  fill(205, 00, 0);
  rect(140, height/2, 150, 150);
  fill(255);
  text(scoreRouge, 140, height/2);
  fill(25);
  rect(width-140, height/2, 150, 150);
  fill(255);
  text(scoreNoir, width-140, height/2);
  popMatrix();
  textSize(25);
  textAlign(CENTER);
  fill(0);
  if (i!=0) {
    text("image " + i + "/"+nbreImages, width/2, height-2*height/7);
  }
}
