PImage psyc;
//PShader blur;

PImage originalImage;
PImage redImage = createImage(320, 240, RGB);
PImage greenImage = createImage(320, 240, RGB);
PImage blueImage = createImage(320, 240, RGB);

color originalColor, finalColor;
float r, g, b;

void setup() {
  size(800,600);
  
  //originalImage = loadImage("psyc.jpg");
  //processImage();
  //image(originalImage, 0,0);
  //image(redImage, 320, 0);
  //image(greenImage, 0, 240);
  //image(blueImage, 320, 240);
  

  psyc = loadImage("psyc.jpg");
  //blur = loadShader("blur.glsl");
  //psyc.filter(INVERT);
  psyc.filter(THRESHOLD);
  //psyc.filter(BLUR, 3);
}

void draw() {
  image(psyc, 0, 0);
  //filter(blur);
  //float x = dist(0, 0, mouseX, mouseY);
  //println(x);
  //background(x, x, x);
}

void processImage() {
  for (int x = 0; x < 320; x++) {
    
    for (int y = 0; y < 240; y++) {
      
      originalColor = originalImage.get(x, y);
      
      r = red(originalColor);
      g = green(originalColor);
      b = blue(originalColor);
      
      float averageColor = (0.3* r + 0.59 * g + 0.11 * b) / 3;
      
      finalColor = color(averageColor, averageColor, averageColor);
      redImage.set(x, y, finalColor);
      
      finalColor = color(0, g, 0);
      greenImage.set(x, y, finalColor);
      
      finalColor = color(0, 0, b);
      blueImage.set(x, y, finalColor);
      
    }
  }
}
