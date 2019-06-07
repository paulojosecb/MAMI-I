enum State { //<>//
  RESTING, DROPPING
}

class Player {

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
  }

  void update() {
    this.updateBalls();
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
    if ((state == State.DROPPING) && (balls > 0)) {
      removeBall();
    }
  }

  void move(int direction) {
    print(direction);
    if ((direction == -1) && (position.x > 160)) {
      position.x -= speed;
    } else if ((direction == 1) && (position.x < 650)) {
       position.x += speed;
    }
  }
}
