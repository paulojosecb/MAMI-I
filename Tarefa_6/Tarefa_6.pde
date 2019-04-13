float xProportion;
float yProportion;

void setup() {
  size(800, 600);
}

void draw() {
  xProportion = mouseX / 800;
  yProportion = mouseY/ 600;
  
  fill(255);
  rect(width/2 - 640/2, height/2 - 360/2, 640, 360);
  
  fill(255, 0, 0);
  ellipse(width/2, height/2, 50, 50);
}
