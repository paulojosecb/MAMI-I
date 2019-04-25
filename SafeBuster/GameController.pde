enum GameState {
  PLAYING, GAMEOVER
}

class GameController {
 
  BallController ballController;
  Spawner spawner;
  Player player;
  GameState state; 
 
  GameController() {
    startNewGame();
  }
  
  void update() {
    
    if (state == GameState.PLAYING){
      spawner.update();
      ballController.update();
      player.update();
      draw();
    } else {
      text("GAME OVER", width/2, height/2);
      
      if ((keyPressed) && (key == ENTER)) {
        startNewGame();
      }
    }

  }
  
  void draw() {
    spawner.draw();
    player.draw();
    ballController.draw();
  }
  
  void startNewGame() {
    ballController = new BallController(this);
    spawner = new Spawner(ballController);
    player = new Player(this);
    state = GameState.PLAYING;
    clear();
  }
   //<>//
}
