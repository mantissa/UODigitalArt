
// a dynamic array to store pts
ArrayList<PVector>history;

void setup(){

  smooth();
  size(800, 400, P2D);
  
  history = new ArrayList();
}

void draw(){

  background(255);
  
  stroke(0);
  
  // just draw the points
  //drawLine();
  
  // draw the ribbon
  drawRibbon();
}

void drawLine(){
  
  // just draw a line based on the history
  
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
  
  // begin the triangle strip
  beginShape(TRIANGLE_STRIP);
  
  for(int i=0; i<history.size()-1; i++){
     
     // get consecutive pts
      PVector pt1 = history.get(i);
      PVector pt2 = history.get(i+1);
      
      // calculate the angle between consecutive pts
      PVector d = pt2.get();
      d.sub(pt1);
      float angle = atan2( d.y, d.x );
      
      // expand from center points based on angle
      PVector offset = new PVector();
      offset.x = cos( angle + PI/2 ) * thick;
      offset.y = sin( angle + PI/2 ) * thick;
    
      // add vertices
      vertex( pt1.x + offset.x, pt1.y + offset.y );
      vertex( pt1.x - offset.x, pt1.y - offset.y );
  }
  
  // end of shape
  endShape();
}

void mousePressed(){
 
   // clear the history & add first point
  
   history.clear();
  
   history.add( new PVector(mouseX, mouseY) ); 
}

void mouseDragged(){
  
  // add other points to the array
  
   history.add( new PVector(mouseX, mouseY) ); 
}
