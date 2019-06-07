class PowerupController {
  
  PVector position;
  
  int next;
  int nextCounter;
  
  int DURATION = 120;
  int durationCounter;
  
  Boolean isPowered;
  Boolean isOnScreen;
  
  int MAX_TIME = 180;
  
  int screenCounter;
  
  GameController controller;
  
  PowerupController(GameController gc) {
    position = new PVector(width/2, 415);
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
    rect(position.x, position.y, 25, 25);
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
  
  Boolean isCollidingWith(Player player) {
    if ((position.x >= player.position.x) && (position.x <= player.position.x + player.sprites[0].width)) {
      return true;
    }
    return false;
  }
}
