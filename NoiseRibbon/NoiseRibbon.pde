
// store the history and the current point
ArrayList<PVector>history;
PVector currentPt;

void setup(){

  smooth();
  size(800, 400, P2D);
  frameRate(30);
  
  history = new ArrayList();
  currentPt = new PVector(width/2, height/2);
}

void draw(){

  background(255);
  
  stroke(0);
  
  // calculate the angle using perlin noise
  float angle = noise( 0.059 * float(frameCount) ) * TWO_PI;
  
  // visualize the current angle
  drawAngle( angle );
  
  pushMatrix();
  
  // draw shape in the center
  
   if( history.size() > 0 ){
  
    // offset by the center point so the shape
    // is always drawn in the middle of the screen
    PVector center = history.get(history.size()/2);
    translate(-center.x, -center.y);
    translate( width/2, height/2);
  
   }
  
  // draw the ribbon
  drawRibbon( angle );
  
  popMatrix();
}


void drawAngle(float angle ){
 
    float x = cos(angle) * 20;
    float y = sin(angle) * 20;
    
    line( 40, 40, 40+x, 40+y);
}

void drawRibbon(float angle){
  
  float x = cos(angle) * 5;
  float y = sin(angle) * 5;
  
  currentPt.x += x;
  currentPt.y += y;
  
  float thick = 10;
  
  // add a new pt based on the current angle
  // if we have more than 50 pts, erase the first one
  history.add( new PVector(currentPt.x, currentPt.y) ); 
  if( history.size() > 50 ) history.remove(0);
  
  noFill();
  beginShape(TRIANGLE_STRIP);
  
  // create a triangle strip based on the 
  // history of points and their angles
  for(int i=0; i<history.size()-1; i++){
     
      PVector pt1 = history.get(i);
      PVector pt2 = history.get(i+1);
      
      PVector d = pt2.get();
      d.sub(pt1);
      float a = atan2( d.y, d.x );
      
      PVector offset = new PVector();
      offset.x = cos( a + PI/2 ) * thick;
      offset.y = sin( a + PI/2 ) * thick;
    
      vertex( pt1.x + offset.x, pt1.y + offset.y );
      vertex( pt1.x - offset.x, pt1.y - offset.y );
  }
  
  endShape();
}


