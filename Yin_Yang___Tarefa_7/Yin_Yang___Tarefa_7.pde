PVector position;
float diameter = 600;
Boolean isShrinking = false;

PVector ellipsePointsWhite = new PVector(3.14/2, 3.14 * 1.5);
PVector ellipsePointsBlack = new PVector(0 - 3.14/2, 3.14/2);


void setup() {
  size(800, 800);
}

void draw() {
  clear();
  background(200);
  position = new PVector(mouseX, mouseY);
  drawYinYangOn(position, diameter);
  
  if (diameter >= 700) {
    isShrinking = true;
  } else if (diameter <= 600) {
    isShrinking = false;
  }
  
  diameter = diameter + (isShrinking ? -3 : 3);
}

void drawYinYangOn(PVector position, float diameter) {

  fill(255);
  drawArc(position, diameter, ellipsePointsWhite);
  
  fill(0);
  drawArc(position, diameter, ellipsePointsBlack);
  
  fill(0);
  noStroke();
  ellipse(position.x, position.y - diameter/4, diameter/2, diameter/2);
  fill(255);
  ellipse(position.x, position.y - diameter/4, diameter/8, diameter/8);
  
  fill(255);
  noStroke();
  ellipse(position.x, position.y + diameter/4, diameter/2, diameter/2);
  fill(0);
  ellipse(position.x, position.y + diameter/4, diameter/8, diameter/8);
  
}

void drawArc(PVector position, float diameter, PVector ellipsePoints) {
   arc(position.x, position.y, diameter, diameter, ellipsePoints.x, ellipsePoints.y);
}
