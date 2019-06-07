enum State { //<>//
  RESTING, DROPPING
}

class Player {

  PVector position;
  int speed;
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

    if (direction == -1) {
      
    } else if (direction == 1) {

      if (position.x == PositionEnum.CENTER) {
        position.x = PositionEnum.RIGHT;
      } else if (position.x == PositionEnum.LEFT) {
        position.x = PositionEnum.CENTER;
      } else if (position.x == PositionEnum.STATION) {
        position.x = PositionEnum.LEFT;
        state = State.RESTING;
      }
    }
  }

  void checkInput() {

    if ((keyPressed == true) && (key == CODED)) {
    }
  }
}
