class GameController {
 
  BallController ballController;
  Spawner spawner;
  Player player;
 
  GameController() {
    ballController = new BallController(this);
    spawner = new Spawner(ballController);
    player = new Player();
  }
  
  void update() {
    spawner.update();
    ballController.update();
    player.update();
    draw();
  }
  
  void draw() {
    spawner.draw();
    player.draw();
    ballController.draw();
  }
  
}
