class Ball {

  PVector position;
  float radius = 25;
  Boolean isSafe = false;
  float correctPosition = 0;
  
  Ball(PVector position) {
    
    this.position = position;
  
  }
    
  void draw() {
    
    if (isSafe) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    
    ellipseMode(CORNER);
    ellipse(position.x + radius/2, position.y, radius, radius);
  }
  
}
