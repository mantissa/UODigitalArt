

ArrayList<PVector>history;

void setup(){

  smooth();
  size(800, 400, P2D);
  
  history = new ArrayList();
}

void draw(){

  background(255);
  
  stroke(0);
  
  //drawLine();
  
  drawRibbon();
}

void drawLine(){
  
  beginShape();
  
  for(int i=0; i<history.size(); i++){
     
      PVector pt = history.get(i);
    
      vertex( pt.x, pt.y );
  }
  
  endShape();
}

void drawRibbon(){
  
  float thick = 10;
  
  noFill();
  //fill(0);
  beginShape(TRIANGLE_STRIP);
  
  for(int i=0; i<history.size()-1; i++){
     
      PVector pt1 = history.get(i);
      PVector pt2 = history.get(i+1);
      
      PVector d = pt2.get();
      d.sub(pt1);
      float angle = atan2( d.y, d.x );
      
      PVector offset = new PVector();
      offset.x = cos( angle + PI/2 ) * thick;
      offset.y = sin( angle + PI/2 ) * thick;
    
      vertex( pt1.x + offset.x, pt1.y + offset.y );
      vertex( pt1.x - offset.x, pt1.y - offset.y );
  }
  
  endShape();
}

void mousePressed(){
 
   history.clear();
  
   history.add( new PVector(mouseX, mouseY) ); 
}

void mouseDragged(){
  
   history.add( new PVector(mouseX, mouseY) ); 
}
