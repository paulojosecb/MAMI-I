class Player {
  
  PVector position;
  ArrayList<Ball> balls;
    
  Player() {
    position = new PVector(PositionEnum.CENTER, 425);
    balls = new ArrayList<Ball>();
  }
  
  void update() {

  }
  
  void draw() {
    fill(0, 0, 255);
    rect(position.x, position.y, 50, 125);
  }
 
  void saveBall(Ball ball) {
    
    if (balls.size() < 3) {
      ball.isSafe = true;
      balls.add(ball);
      
      for(int i = 0; i < balls.size(); i++) {
        Ball b = balls.get(i);
         if (i == 0) {
           b.correctPosition = position.y + b.radius * 2;
         } else if (i == 1) {
           b.correctPosition = position.y + b.radius * 1;
         } else if (i == 2) {
           b.correctPosition = position.y + b.radius * 0;
         }
      }

    }
    
  }
  
  void move(int direction) {
    
     if (direction == -1) {
           
           if (position.x == PositionEnum.CENTER) {
             position.x = PositionEnum.LEFT;
           } else if (position.x == PositionEnum.RIGHT) {
             position.x = PositionEnum.CENTER;
           }
           
         } else if (direction == 1) {
         
           if (position.x == PositionEnum.CENTER) {
             position.x = PositionEnum.RIGHT;
           } else if (position.x == PositionEnum.LEFT) {
             position.x = PositionEnum.CENTER;
           }
           
     }
     
     for(Ball ball: balls) {
       ball.position.x = position.x;
     }
     
  }
  
  void checkInput() {
    
     if ((keyPressed == true) && (key == CODED)) {
         
        
       }
  }  
}
