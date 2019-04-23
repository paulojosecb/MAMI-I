class BallController {
  
  float UPDATE_FREQUENCY = 40;
  float frameCounter;
  GameController gameController;
  
  ArrayList<Ball> balls;
  
  BallController(GameController gc) {
    frameCounter = 0;
    balls = new ArrayList<Ball>();
    gameController = gc;
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
      
      if (ball.isSafe == false) {
        
         ball.position.y += ball.radius * 2;
         
         if ((ball.position.y == gameController.player.position.y) && (ball.position.x == gameController.player.position.x)) {
           gameController.player.saveBall(ball); //<>//
         }
         
      } else {
      
        if (ball.position.y != ball.correctPosition) {
          ball.position.y += ball.radius;
        }
        
      }
      
    }
  }
  
  
  
}
