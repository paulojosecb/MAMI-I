void setup() {
  size(200, 200);
  
  PVector pointZero = new PVector(0,0);
  PVector point = new PVector(8, 15);
  
  println(distanceBetween(pointZero, point));
}

void draw() {
  //println("Distancia X: ", distanceBetween(0, mouseX));
  //println("Distancia Y: ", distanceBetween(0, mouseY));
}

float distanceBetween(float pointA, float pointB) {
  return abs(pointB - pointA);
}

float distanceBetween(PVector pointA, PVector pointB) {  
  
  PVector vector = new PVector(distanceBetween(pointA.x, pointB.x), distanceBetween(pointA.y, pointB.y));
  return sqrt(vector.x * vector.x + vector.y * vector.y);

}
