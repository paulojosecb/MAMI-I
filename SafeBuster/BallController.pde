class BallController {
  
  float UPDATE_FREQUENCY = 40;
  float frameCounter;
  
  ArrayList<Ball> balls;
  
  BallController() {
    frameCounter = 0;
    balls = new ArrayList<Ball>();
  }
 
  void draw() {
    for(Ball ball: balls) {
      ball.draw();
    }
  }
  
  void update() {
    
    if (frameCounter >= UPDATE_FREQUENCY) {
      updateBallsPosition();
      frameCounter = 0;
    }
    
    frameCounter++;
 
  }
  
  void addBall(Ball ball) {
    balls.add(ball);
  }
  
  void updateBallsPosition() {
    for(Ball ball : balls) {
      ball.position.y += 100;
    }
  }
  
  
  
}
