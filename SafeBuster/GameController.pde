class GameController {
 
  BallController ballController;
  Spawner spawner;
 
  GameController() {
    ballController = new BallController();
    spawner = new Spawner(ballController);
  }
  
  void update() {
    spawner.update();
    ballController.update();
    draw();
  }
  
  void draw() {
    ballController.draw();
    spawner.draw();
  }
  
}
