MEF mef = new MEF();

PImage imgMartelando;
PImage imgParado;

void setup() {
  size(300, 300);
  background(255);
  
  imgMartelando = loadImage("martelando.png");
  imgParado = loadImage("parado.png");
  
}

void draw() {
  clear();
  mef.update();
  
  if (mef.martelando == 0) {
    image(imgParado, 150, 150); //<>//
  } else { //<>//
    image(imgMartelando, 150, 150);
  } 
  
}
