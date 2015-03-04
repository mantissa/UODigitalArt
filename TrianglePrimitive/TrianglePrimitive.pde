

void setup(){

  smooth();
  size(550, 400, P2D); 
}

void draw(){

  background(255);

  // begin shape
  // pts should be arranged in pairs
  // quad shape (rectangle) will be drawn between consecutive pairs
  
  fill(102);
  beginShape(TRIANGLE_STRIP);
  
  // add 8 vertices (makes 3 quads)
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
