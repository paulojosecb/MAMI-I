PVector center;

void setup() {
  size(800, 800);
  center = new PVector(width/2, height/2);
}

void draw() {
  clear();
  background(200);
  fill(255);
  line(center.x, center.y, mouseX, mouseY);
  
  PVector mouse = new PVector(mouseX, mouseY);
  
  float distance = distanceBetween(center, mouse);
  
  text("Position X: " + distance, mouseX, mouseY - 20, 300, 50);
}

float distanceBetween(float pointA, float pointB) {
  return abs(pointB - pointA);
}

float distanceBetween(PVector pointA, PVector pointB) {  
  
  PVector vector = new PVector(distanceBetween(pointA.x, pointB.x), distanceBetween(pointA.y, pointB.y));
  return sqrt(vector.x * vector.x + vector.y * vector.y);

}
