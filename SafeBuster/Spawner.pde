class Spawner {
  
  float nextMove;
  float moveCounter;
  
  float spawnFrequency;
  float spawnCounter;
  
  PVector position;
  
  BallController ballController;

  Spawner(BallController bc) {
    nextMove = 60;
    moveCounter = 0;
    
    spawnFrequency = 120;
    spawnCounter = 0;
    
    position = new PVector(100, PositionEnum.LEFT);
      
    ballController = bc;
  }
  
  void update() {
    
    if (spawnCounter >= spawnFrequency) {
      spawnBall();
      spawnCounter = 0;
    }
    
    if (moveCounter >= nextMove) {
      move();
      moveCounter = 0;
    }
    
    spawnCounter++;
    moveCounter++;
    
  }

  void draw() {
    fill(255);
    rect(position.x, position.y, 50, 100);
  }
  
  void spawnBall() {
    ballController.balls.add(new Ball(new PVector(position.x, position.y + 10)));
  }
  
  void move() {
    
    if ((position.x == PositionEnum.LEFT) || (position.x == PositionEnum.RIGHT)) {
      
      position.x = PositionEnum.CENTER;
      
    } else {
      
      if (random(0, 1) > 0.5) {
        position.x = PositionEnum.RIGHT;
      } else {
        position.x = PositionEnum.LEFT;
      }
      
    }
  
  }
  
}
