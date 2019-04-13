class Ball {

  PVector position;
  float radius = 50;
  
  Ball(PVector position) {
    
    this.position = position;
  
  }
    
  void draw() {
    fill(255);
    ellipseMode(CORNER);
    ellipse(position.x, position.y, radius, radius);
  }
  
}
