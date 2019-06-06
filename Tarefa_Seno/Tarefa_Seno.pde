int pointToSpawn;
ArrayList<PVector> ellipsePoints;
PImage boat;

void setup() {
  size(800, 600);
  noStroke();
  pointToSpawn = width / 2;
  ellipsePoints = new ArrayList<PVector>();
  boat = loadImage("boat.png");
}


float x = 0;
float y = 0;

void draw() {
  clear();
  background(255);
  y = sin(x) * 10;
  x+= PI * 2 / 60;    
  translate(width/2, height/2);
  ellipsePoints.add(new PVector(pointToSpawn, y));
  movePoints();
  drawPoints();
  removePoints();
  rotate(y / 100);
  fill(0, 0, 255);
  image(boat, -126,-126);
}

void movePoints() {
  for(PVector point: ellipsePoints) {
    point.x -= (width / 2) / 60;
  }
}

void drawPoints() {
  for(PVector point: ellipsePoints) {
    fill(0, 0, 255);
    ellipse(point.x, point.y, 5, 5);
  }
}

void removePoints() {
  for(int i = ellipsePoints.size() - 1; i >= 0; i--) {
    if (ellipsePoints.get(i).x < -width/2 - 5){
      ellipsePoints.remove(i);
    }
  }
} 
