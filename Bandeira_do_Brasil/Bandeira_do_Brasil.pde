float module = 10;
float flagWidth = 20;
float flagHeight = 14;
PVector flagSize;

void setup() {
  size(1200, 800);
  flagSize = new PVector(flagWidth * module, flagHeight * module);
  drawBrazilianFlag(); //<>//
}

void drawBrazilianFlag() {
  clear();
  noStroke();
  
  PVector flagPosition = new PVector((width - flagWidth * module) / 2, (height - flagHeight * module) /2);
  drawOutsideRectOn(flagPosition, flagSize);
  drawInternalQuadBasedOn(flagPosition, flagSize);
  drawInternalCircleBasedOn(flagPosition, flagSize);

}

void drawOutsideRectOn(PVector flagPosition, PVector flagSize) {
  
  fill(66, 147, 69);
  rect(flagPosition.x, flagPosition.y , flagSize.x, flagSize.y); //<>//
  
}

void drawInternalQuadBasedOn(PVector flagPosition, PVector flagSize) {
  
  fill(242, 216, 73);
  
  float distanceBetweenVertixes = module * 1.7;
   //<>//
  PVector point1 = new PVector(flagPosition.x + distanceBetweenVertixes, flagPosition.y + flagSize.y / 2);
  PVector point2 = new PVector(flagPosition.x + flagSize.x / 2, flagPosition.y + distanceBetweenVertixes); //<>//
  PVector point3 = new PVector(flagPosition.x + flagSize.x - distanceBetweenVertixes, flagPosition.y + flagSize.y / 2);
  PVector point4 = new PVector(flagPosition.x + flagSize.x /2, flagPosition.y + flagSize.y - distanceBetweenVertixes);
  
  quad(point1.x, point1.y, point2.x, point2.y, point3.x, point3.y, point4.x, point4.y); 
   
}

void drawInternalCircleBasedOn(PVector flagPosition, PVector flagSize) {

  fill(7, 39, 109);
  ellipseMode(CENTER);
  float diameter = module * 3.5 * 2;
  ellipse(flagPosition.x + flagSize.x / 2, flagPosition.y + flagSize.y / 2, diameter, diameter);
   //<>//
}
