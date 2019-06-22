enum GameState {
  PLAYING, GAMEOVER
}

class GameController {
 
  BallController ballController;
  ImageController imageController;
  PowerupController powerupController;
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
      powerupController.update();
      draw();
    } else {
      fill(0,0,0, 100);
      rect(0, 0, width, height);
      fill(255);
      text("GAME OVER", width/2 - 75, height/2);
      textSize(20);
      text("Press enter ENTER to restart", width/2-125, height/2 + 25);
      
      if ((keyPressed) && (key == ENTER)) {
        startNewGame();
      }
    }

  }
  
  void draw() {
    textSize(28);
    fill(0);
    text("Score: " + points, width - 200, 28);
    
    if (powerupController.isPowered) {
      textSize(22);
      text("Fast mode", width - 200, 70);
    }
  }
  
  void startNewGame() {
    ballController = new BallController(this);
    powerupController = new PowerupController(this);
    powerupController.sprite = imageController.powerUp;
    spawner = new Spawner(ballController, imageController.gold, imageController.enemy);
    
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
