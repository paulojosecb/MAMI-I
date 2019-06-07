enum State { //<>//
  RESTING, DROPPING
}

class Player {
  
  int DROP_COOLDOWN = 30;
  int cooldownCounter;

  PVector position;
  int speed = 10;
  int balls;
  GameController gameController;
  State state;
  PImage[] sprites; 

  Player(GameController gc) {
    sprites = new PImage[4];
    position = new PVector(PositionEnum.CENTER, 390);
    balls = 0;
    gameController = gc;
    state = State.RESTING;
    cooldownCounter = 0;
  }

  void update() {
    this.updateBalls();
    if (isOnDroppingZone()){
      state = State.DROPPING;
      cooldownCounter++;
    } else {
      state = State.RESTING;
      cooldownCounter = 0;
    }
    this.draw();
  }

  void draw() {
    fill(0, 0, 255);
    image(sprites[balls], position.x, position.y);
  }

  void saveBall() {
    balls++;
    gameController.points++;
  }

  void removeBall() {
    balls--;
  }

  void updateBalls() {
    if ((state == State.DROPPING) && (balls > 0) && cooldownCounter >= DROP_COOLDOWN) {
      cooldownCounter = 0;
      removeBall();
    }
  }

  void move(int direction) {
    if ((direction == -1) && (position.x > 160)) {
      position.x -= speed;
    } else if ((direction == 1) && (position.x < 650)) {
       position.x += speed;
    }
  }
  
  Boolean isOnDroppingZone() {
    if (this.position.x >= 160 && this.position.x <= 200) {
      return true;
    }
    return false;
  }
}
