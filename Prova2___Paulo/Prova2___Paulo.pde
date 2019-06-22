float r = 200;
PImage cat;

color selectedColor;
color compColor;

float limit = 0.5;

void setup() {
  size(800, 600);
  cat = loadImage("cat.jpeg");
  colorMode(HSB, 360, 100, 100);
  drawCromaticCircle();
  drawOriginalImage();
  drawFilteredImage();
}

void draw() {
  
}


void drawCromaticCircle() {
  float ang = 2 * PI / 30;
  for(int i = 0; i < 30; i++) {
    fill(degrees(ang * i) % 360, 80, 80);
    arc(width/2 - 200, height/2, r, r, ang * i, ang * (i + 1));
  }
}

void drawOriginalImage() {
  rectMode(CENTER);
  image(cat, 350, 100);
}

void drawFilteredImage() {
  cat.filter(THRESHOLD, limit);
  image(cat, 350, 350); 
}

void processFilterdImage() {
  for(int x = 0; x < cat.width; x++) { //<>//
    for(int y = 0; y < cat.height; y++) {
      color pixelColor = cat.get(x, y);
      float b = brightness(pixelColor);
      
      if (b == 0) {
        cat.set(x,y, compColor);
      } else {
        cat.set(x,y, selectedColor);
      }
      
    }
  }
  image(cat, 350, 350);  //<>//
}

void mouseClicked() {
  selectedColor = get(mouseX, mouseY);
  compColor = getComplementaryColorFor(selectedColor);  
  processFilterdImage(); //<>//
}

color getComplementaryColorFor(color c) {
  color comp = color(0, 0, 0);
  
  float ang = 2 * PI / 30;
  for(int i = 0; i < 30; i++) {
    color currentColor = color(degrees(ang * i) % 360, 80, 80);
    
    if (currentColor == c) {
      comp = color((degrees(ang * i) + 180) % 360, 80, 80);
    }
  }
  
  return comp;
}
