class Ball {

  PVector position;
  float radius = 25;
  Boolean isSafe = false;
  float correctPosition = 0;
  PImage sprite;
  
  Ball(PVector position, PImage sp) {
    this.sprite = sp;
    this.position = position;
  
  }
    
  void draw() {
    
    if (isSafe) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
    

    //imageMode(CENTER);
    image(sprite, position.x + 12, position.y);
    //imageMode(CORNER);
    
  }
  
}
