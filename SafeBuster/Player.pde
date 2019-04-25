enum State {
  RESTING, DROPPING
}

class Player {
  
  PVector position;
  int balls;
  GameController gameController;
  State state;
    
  Player(GameController gc) {
    position = new PVector(PositionEnum.CENTER, 425);
    balls = 0;
    gameController = gc;
    state = State.RESTING;
  }
  
  void update() {
    
  }
  
  void draw() {
    fill(0, 0, 255);
    rect(position.x, position.y, 50, 125);
    fill(255);
    text(balls, position.x + 25, position.y + 20);
  }
 
  void saveBall() {
    balls++; //<>//
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
           
           if (position.x == PositionEnum.CENTER) {
             position.x = PositionEnum.LEFT;
           } else if (position.x == PositionEnum.RIGHT) {
             position.x = PositionEnum.CENTER;
           } else if (position.x == PositionEnum.LEFT) {
             position.x = PositionEnum.STATION;
             state = State.DROPPING;
           }
           
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
