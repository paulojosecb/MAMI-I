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
      gameController.player.updateBalls();
    }
    
    frameCounter++;
 
  }
  
  void addBall(Ball ball) {
    balls.add(ball);
  }
  
  void updateBallsPosition() {
    
    ArrayList<Ball> ballsToRemove = new ArrayList<Ball>();
    
    for(Ball ball : balls) {
      
      if (ball.isSafe == false) {
        
         ball.position.y += ball.radius * 2;
         
         if (ball.position.y  >= height) {
           gameController.state = GameState.GAMEOVER;
         }
         
         if ((ball.position.y == gameController.player.position.y) && (ball.position.x == gameController.player.position.x)) {
           if (gameController.player.balls < 3) {
             gameController.player.saveBall();
             ballsToRemove.add(ball);
           }
            //<>//
         }
         
      } else {
      
        if (ball.position.y != ball.correctPosition) {
          ball.position.y += ball.radius;
        }
        
      }
      
    }
    
    for (Ball ball: ballsToRemove) {
      balls.remove(ball);
    }
  }
  
  
  
}
