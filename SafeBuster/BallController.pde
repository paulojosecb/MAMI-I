class BallController { //<>//

  float UPDATE_FREQUENCY = 1;
  float frameCounter;
  GameController gameController;

  ArrayList<Ball> balls;

  BallController(GameController gc) {
    frameCounter = 0;
    balls = new ArrayList<Ball>();
    gameController = gc;
  }

  void draw() {
  }

  void update() {
      updateBalls();
  }

  void addBall(Ball ball) {
    balls.add(ball);
  }

  void updateBalls() {

    ArrayList<Ball> ballsToRemove = new ArrayList<Ball>();

    for (Ball ball : balls) {

      ball.update();
      
      if (ball.collidedWith(gameController.player)){
        if (gameController.player.balls < 3) {
          gameController.player.saveBall();
          ballsToRemove.add(ball);
        }
      }
    }

    for (Ball ball : ballsToRemove) {
      balls.remove(ball);
    }
  }
  
  void gameOver() {
    gameController.state = GameState.GAMEOVER;
  }
}
