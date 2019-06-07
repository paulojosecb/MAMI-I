enum GameState {
  PLAYING, GAMEOVER
}

class GameController {
 
  BallController ballController;
  ImageController imageController;
  Spawner spawner;
  Player player;
  GameState state;
  int points;
 
  GameController() {
    imageController = new ImageController();
    startNewGame();
  }
  
  void update() {
    
    if (state == GameState.PLAYING){
      spawner.update();
      ballController.update();
      player.update();
      draw();
    } else {
      text("GAME OVER", width/2 - 75, height/2);
      textSize(20);
      text("Press enter ENTER to restart", width/2-125, height/2 + 25);
      
      if ((keyPressed) && (key == ENTER)) {
        startNewGame();
      }
    }

  }
  
  void draw() {
    spawner.draw();
    textSize(28);
    fill(0);
    text("Score: " + points, width - 200, 28);
  }
  
  void startNewGame() {
    ballController = new BallController(this);
    spawner = new Spawner(ballController, imageController.ball, imageController.enemy);
    
    points = 0;
    
    player = new Player(this);
    player.sprites[0]= imageController.playerEmpty;
    player.sprites[1] = imageController.player1;
    player.sprites[2] = imageController.player2;
    player.sprites[3] = imageController.player3;

    
    state = GameState.PLAYING;
    clear();
  }
   //<>//
}
