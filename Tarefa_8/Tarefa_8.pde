PVector rectSize = new PVector(480, 270);
PVector rectPosition;

void setup() {
  size(800, 600);
  rectPosition = new PVector(width/2 - rectSize.x/2, height/2 - rectSize.y/2);
}

void draw() {
   clear();
   background(0);
    
   drawRectOn(rectPosition, rectSize);
}

PVector getBallMappedPositionTo(PVector rectSize) {
 
  PVector mappedPosition = new PVector(0,0);
  
  float mappedX = map(parseFloat(mouseX), 0, width, 0, rectSize.x);
  float mappedY = map(parseFloat(mouseY), 0, height, 0, rectSize.y);
    
  mappedPosition = new PVector(mappedX, mappedY);

  return mappedPosition;
}

void drawRectOn(PVector position, PVector size) {
  
   fill(200);
   rect(position.x, position.y, size.x, size.y);
   
   drawEllipseBasedOn(position, size, getBallMappedPositionTo(size));
  
}

void drawEllipseBasedOn(PVector rectPosition, PVector rectSize, PVector ballMappedPosition) {
  fill(255);
  ellipse(rectPosition.x + ballMappedPosition.x, rectPosition.y + ballMappedPosition.y, 50, 50);
}
