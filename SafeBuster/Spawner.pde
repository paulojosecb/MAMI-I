class Spawner {
    
  float MAX_POSITION_X = 525;
  float MIN_POSITION_X = 275;
  float SPEED = 2;
  
  float direction = 1;
  
  float nextSpawn;
  float spawnCounter;
  
  PVector position;
  
  PImage ballSprite;
  PImage sprite;
  
  BallController ballController;

  Spawner(BallController bc, PImage bsp, PImage esp) {
    nextSpawn = 120;
    spawnCounter = 0;
    
    ballSprite = bsp;
    sprite = esp;
    
    position = new PVector(width/2, 40);
      
    ballController = bc;
  }
  
  void update() {
    
    if (spawnCounter >= nextSpawn) {
      spawnBall();
      spawnCounter = 0;
      nextSpawn = randomNext();
    }
    
    this.move();
    this.draw();
    
    spawnCounter++;    
  }

  void draw() {
    fill(255);
    image(sprite, position.x, position.y);
  }
  
  void spawnBall() {
    ballController.balls.add(new Ball(new PVector(position.x, position.y), ballSprite, ballController));
  }
  
  void move() {
    if (position.x >= MAX_POSITION_X || position.x <= MIN_POSITION_X) {
      direction *= -1;
    }
    
    position.x += SPEED * direction;
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
