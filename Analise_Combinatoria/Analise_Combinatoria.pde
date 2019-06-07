int size = 20;
int padding = 16;

void setup() {
  size(800, 600);
  printCombinations();
  drawRects();
}

void printCombinations() {
  int even = 0;
  int odd = 0;
  for(int i = 0; i < 1; i++) {
    for(int z = 0; z < 1; z++) {
      if (((i + z) % 2) == 0) {
        even++;
      } else {
        odd++;
      }
      
    }
  }
}

void drawRects() {
  fill(255);
  rect(width / 2 - size - padding, height / 2 - 200, size, 100 * ); 
}
