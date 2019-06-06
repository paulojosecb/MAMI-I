PImage psyc;
int number = 300000;

void setup() {
  size(800, 600);
  psyc = loadImage("psyc.jpg");
  processImage();
  image(psyc, 0,0);
}

void draw() {
  
  image(psyc, 0, 0);
}

void processImage() {
  for(int i = 0; i < number ; i++) {
    float x = random(psyc.width);
    float y = random(psyc.height);
    
    float r = random(255);
    float g = random(255);
    float b = random(255);
    
    color randomColor = color(r,g,b);
    psyc.set(int(x), int(y), randomColor);
  }
}
