

PImage catImage;
ArrayList<PVector>history;

void setup(){

  smooth();
  size(768, 480, P2D);
  
  catImage = loadImage("cute_cat.jpg");
  
  history = new ArrayList();
}

void draw(){

  //background(255);
  tint(255);
  
  image( catImage, 0, 0 );
  
  stroke(50);
 
  drawRibbon();
}

void drawRibbon(){
  
  if( history.size() < 2 ) return;
  
  float thick = 10;
  
  
  
   catImage.loadPixels();  
  
  int pos; // = (int(pt0.y) * catImage.width) + int(pt0.x);
  color c = color(0); // = catImage.pixels[pos];
  
  //noStroke();
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
      
      if( i % 2 == 0 ){
        
        // keep x & y in bounds
        int y = min(int(pt1.y), height-1);
        y = max(0, y);
        int x = min(int(pt1.x), width-1);
        x = max(0, x);
      
        // caltulate the position and then
        // get the pixel at the current positions
        pos = y * catImage.width + x;
        c = catImage.pixels[pos];
      }
      
      fill(c);
    
      vertex( pt1.x + offset.x, pt1.y + offset.y );
      vertex( pt1.x - offset.x, pt1.y - offset.y );
  }
  
  endShape();
  
  catImage.updatePixels();
}

void mousePressed(){
 
   history.clear();
  
   history.add( new PVector(mouseX, mouseY) ); 
}

void mouseDragged(){
  
   history.add( new PVector(mouseX, mouseY) ); 
}
