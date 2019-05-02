class Spawner {
  
  float nextMove;
  float moveCounter;
  
  float nextSpawn;
  float spawnCounter;
  
  PVector position;
  
  PImage ballSprite;
  PImage sprite;
  
  BallController ballController;

  Spawner(BallController bc, PImage bsp, PImage esp) {
    nextMove = 60;
    moveCounter = 0;
    
    nextSpawn = 120;
    spawnCounter = 0;
    
    ballSprite = bsp;
    sprite = esp;
    
    position = new PVector(PositionEnum.LEFT, 40);
      
    ballController = bc;
  }
  
  void update() {
    
    if (spawnCounter >= nextSpawn) {
      spawnBall();
      spawnCounter = 0;
      nextSpawn = randomNext();
    }
    
    if (moveCounter >= nextMove) {
      move();
      moveCounter = 0;
      nextMove = randomNext();
    }
    
    spawnCounter++;
    moveCounter++;
    
  }

  void draw() {
    fill(255);
    image(sprite, position.x, position.y);
    //rect(position.x, position.y, 50, 50);
  }
  
  void spawnBall() {
    ballController.balls.add(new Ball(new PVector(position.x, position.y), ballSprite));
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
  
  int randomNext() {
    int randomNum = int(random(1, 4));
    
    if (randomNum == 1) {
      return NextEnum.SHORT;
    } else if (randomNum == 2) {
      return NextEnum.MEDIUM;
    } else if (randomNum == 3) {
      return NextEnum.LARGE;
    } else {
      return NextEnum.XLARGE;
    }
  
  }
  
}
