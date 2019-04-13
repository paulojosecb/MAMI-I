void setup() {
  size(500, 500);
  drawRects();
}


void drawRects() {
  
  fill(0, 255, 255);
  rect(0,0, width, height * 0.2);
  
  fill(255, 0, 255);
  rect(0, height * 0.9, width, height * 0.1);
  
  fill(255,255, 0);
  rect(0, height * 0.2, width * 0.3, height * 0.7);
  
  fill(0);
  rect(width * 0.3, height * 0.2, width * 0.7, height * 0.7);

}
