float module = 100;
float flagWidth = 500;
float flagRatio = 1.5;

float constantX = 0.0;
float constantY = 0.0;

void setup() {  
  size(800, 600);
  constantX = flagWidth / module;
  constantY = constantX / flagRatio;
}

void draw() {
  clear();
  drawJapanFlag2(mouseX, mouseY); 
}

void drawJapanFlag() {
  
  fill(random(0,255), random(0, 255), random(0, 255));
  rect((width - module * constantX)/ 2.0, (height - module * constantY) / 2, module * constantX, module * constantY); //<>//
  
  noStroke();
  fill(255, 0, 0);
  ellipse(width/2, height/2, (module * constantY) * 3/5, (module * constantY) * 3/5); //<>//

}

void drawJapanFlag2(int x, int y) {
  
  fill(255);
  rect(x - (module * constantX) / 2, y - (module * constantY) / 2, module * constantX, module * constantY);
  
  noStroke();
  fill(255, 0, 0);
  ellipse(x, y, (module * constantY) * 3/5, (module * constantY) * 3/5);

}
