int horizontal = 3;
int vertical = 3;
int blockSize = 100;

void setup() {
  size(300, 300);
  drawPicture();
}


void drawPicture() {
  for(int i = 0; i < vertical; i++) {
    for(int j = 0; j < horizontal; j++) {
      drawBlock(i * blockSize, j * blockSize);
    }
  }
}

void drawBlock(int posX, int posY) {
  fill(random(0 ,255), random(0, 255), random(0, 255));
  rect(posX, posY, blockSize, blockSize);
  
  int currentRadius = blockSize;
  
  for(int i = 0; i < 3; i++) {
    drawCircle(posX, posY, currentRadius);
    currentRadius = int(random(currentRadius * 0.3, currentRadius * 0.9));
  }
  
}

void drawCircle(int posX, int posY, int radius) {
    fill(random(0 ,255), random(0, 255), random(0, 255));
    ellipse(posX + blockSize/2, posY + blockSize/2, radius, radius);
}
