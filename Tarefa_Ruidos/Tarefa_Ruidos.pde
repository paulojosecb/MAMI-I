PImage photo;
int number = 10000;

void setup() {
  size(279, 180);
  photo = loadImage("photo.jpeg");
  processImage();
  addGray();
  addRed();
  addYellow();
  image(photo, 0,0);
}

void draw() {
  
  image(photo, 0, 0);
}

void processImage() {
  for(int i = 0; i < number ; i++) {
    float x = random(photo.width);
    float y = random(photo.height);

    float r = random(255);
    float g = random(255);
    float b = random(255);
    
    color randomColor = color(r,g,b);
    photo.set(int(x), int(y), randomColor);
  }
}

void addGrayScale() {
  photo.filter(GRAY);
}

void addRed() {
  for (int x=0; x < photo.width; x++) {
    for(int y=0; y < photo.height; y++) {
      color originalColor = photo.get(x,y);
      float r = red(originalColor);
      color finalColor = color(r, 0, 0);
      photo.set(x,y, finalColor);
    }
  }
}

void addGray() {
  for (int x=0; x < photo.width; x++) {
    for(int y=0; y < photo.height; y++) {
      color originalColor = photo.get(x,y);
      float r = red(originalColor);
      color finalColor = color(r, r, r);
      photo.set(x,y, finalColor);
    }
  }
}

void addYellow() {
  for (int x=0; x < photo.width; x++) {
    for(int y=0; y < photo.height; y++) {
      color originalColor = photo.get(x,y);
      float r = red(originalColor);
      color finalColor = color(r, r, 0);
      photo.set(x,y, finalColor);
    }
  }
}
