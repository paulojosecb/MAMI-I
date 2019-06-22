class Ball {
  
  BallController controller;
  PVector position;
  float speed = 2;
  float radius = 25;
  Boolean isSafe = false;
  float correctPosition = 0;
  PImage sprite;
  
  Ball(PVector position, PImage sp, BallController controller) {
    this.sprite = sp;
    this.position = position;
    this.controller = controller;
  }
  
  void update() {
    this.move();
    this.checkPosition();
    this.draw();
  }
    
  void draw() {
    
    if (isSafe) {
      fill(0, 255, 0);
    } else {
      fill(255);
    }
   
    image(sprite, position.x + 12, position.y);
    
  }
  
  void move() {
    position.y += speed;
  }
  
  void checkPosition() {
    if (position.y >= 500) {
      controller.gameOver();
    }
  }
  
  Boolean collidedWith(Player player) {
    if ((this.position.x >= player.position.x - this.sprite.width/2) && (this.position.x <= player.position.x + this.sprite.width * 2.5)) {
      if ((this.position.y >= player.position.y) && (this.position.y <= player.position.y + 20)) {
        return true;
      }
    }
    return false;
  }
  
}
