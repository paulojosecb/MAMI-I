PImage psyc;

void setup() {
  psyc = loadImage("psyc.jpg");
  size(320, 240);
}

void draw() {
  colorMode(HSB, 360, 100, 100);
  float x = map(mouseX, 0, 100, 0, 360);
  float y = map(mouseY, 0, 100, 0, 100);
  background(x, y, 100);
  image(psyc, 0, 0);
}

void processImage() {
  
}
