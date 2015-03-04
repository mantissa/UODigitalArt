





void setup(){

  smooth();
  size(550, 400, P2D);
  
  
}

void draw(){

  background(255);

  fill(102);
  beginShape(TRIANGLE_STRIP);
  
  vertex(50, 150);
  vertex(50, 250);
  vertex(200, 150);
  vertex(200, 250);
  vertex(350, 150);
  vertex(350, 250);
  vertex(500, 150);
  vertex(500, 250);
  endShape(CLOSE);
}
