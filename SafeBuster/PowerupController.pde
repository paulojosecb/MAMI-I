class PowerupController {

  float MAX_POSITION_X = 525;
  float MIN_POSITION_X = 275;

  PVector position;

  int next;
  int nextCounter;

  int DURATION = 360;
  int durationCounter;

  Boolean isPowered;
  Boolean isOnScreen;

  int MAX_TIME = 180;

  int screenCounter;
  
  PImage sprite;

  GameController controller;

  PowerupController(GameController gc) {
    position = new PVector(width/2, 430);
    controller = gc;
    nextCounter = 0;
    screenCounter = 0;
    durationCounter = 0;
    isOnScreen = false;
    isPowered = false;
    next = randomNext();
  }

  void update() {
    if (nextCounter >= next) {
      isOnScreen = true;
      nextCounter = 0;
      position.x = int(random(MIN_POSITION_X, MAX_POSITION_X));
      next = randomNext();
    }

    if (isPowered) {
      durationCounter++;

      if (durationCounter >= DURATION) {
        gameController.player.speed = 10;
        durationCounter = 0;
        isPowered = false;
      }
    }

    if (isOnScreen) {

      if (isCollidingWith(gameController.player)) {
        isOnScreen = false;
        isPowered = true;
        gameController.player.speed = 15;
        screenCounter = 0;
        nextCounter = 0;
        next = randomNext();
      }

      this.draw();

      if (screenCounter >= MAX_TIME) {
        isOnScreen = false;
        screenCounter = 0;
      }

      screenCounter++;
    }

    nextCounter++;
  }

  void draw() {
    fill(255, 0, 0);
    image(sprite, position.x, position.y);
    //rect(position.x, position.y, 25, 25);
  }

  int randomNext() {
    int randomNum = int(random(1, 4));

    if (randomNum == 1) {
      return PowerupEnum.SHORT;
    } else if (randomNum == 2) {
      return PowerupEnum.MEDIUM;
    } else if (randomNum == 3) {
      return PowerupEnum.LARGE;
    } else {
      return PowerupEnum.XLARGE;
    }
  }

  Boolean isCollidingWith(Player player) {
    if ((position.x >= player.position.x) && (position.x <= player.position.x + player.sprites[0].width)) {
      return true;
    }
    return false;
  }
}
