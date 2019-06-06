PImage photo1, photo2;
ArrayList<PImage> slices = new ArrayList<PImage>();
int numOfSlices = 5;
int gap = 100;

ArrayList<Integer> positions = new ArrayList<Integer>();
ArrayList<Integer> finalPositions = new ArrayList<Integer>();


void setup() {
  size(800, 600);
  photo1 = loadImage("photo1.jpg");
  photo2 = loadImage("photo2.jpg");
  createSlices();
  print(positions);
}

void draw() {
  clear();
  image(photo1, 0,0);
  drawSlices();
  moveSlices();
}

void mousePressed() {
  reset();
}

void createSlices() {
  int size = photo2.width / numOfSlices;
 
  for(int i=0; i < numOfSlices; i++) {
    
    PImage slice = createImage(size, photo2.height, RGB);
    
    positions.add((size * i) - photo2.width - gap * (4 - i));
    finalPositions.add(size * i);
    
    for(int x = 0; x < size; x++) {
      
      for(int y = 0; y <photo2.height; y++) {
        int newX = x + (size * i);
        color originalColor = photo2.get(newX,y);
        slice.set(x,y, originalColor);
      }
          
    }
         
    slices.add(slice); 
  }
}

void drawSlices() {
  
  for(int i = 0; i < slices.size(); i++) {
    image(slices.get(i), positions.get(i), 0);
  }

}

void moveSlices() {
  for (int i = 0; i < positions.size(); i++) {
    int position = positions.get(i);
    if (position < finalPositions.get(i)) position += 20;
    positions.set(i, position);
  }
}

void reset() {
  slices = new ArrayList<PImage>();
  positions = new ArrayList<Integer>();
  finalPositions = new ArrayList<Integer>();
  createSlices();
}
