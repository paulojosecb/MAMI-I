PVector playerPosition;
PVector playerSize;
float playerVelocity = 20;

PVector ballPosition;
float ballDiameter = 25;

PVector direction;
float velocity = 10.0f;

void setup() {
  size(800, 600);
  playerSize = new PVector(100, 25);
  playerPosition = new PVector(width/2, 500);
  ballPosition = new PVector(width/2, height/2);
 
  direction = new PVector(random(-100, 101) / 100, random(-100, 101) / 100);
  
}

void draw() {
  clear(); //<>//
  background(0);
  
  ballPosition.x += velocity * direction.x;
  ballPosition.y += velocity * direction.y;
  
  checkInput();

  fill(255);
  rectMode(CENTER);
  rect(playerPosition.x, playerPosition.y, playerSize.x, playerSize.y);
  ellipseMode(CENTER);
  ellipse(ballPosition.x, ballPosition.y, ballDiameter, ballDiameter);
  
  checkCollisionWithWalls();
  checkCollisionWithPlayer();
}

void checkCollisionWithWalls() {
  
  if (ballPosition.x - ballDiameter / 2 <= 0) {
    direction.x *= -1;
  }
  
  if (ballPosition.x + ballDiameter / 2 >= width) {
    direction.x *= -1;
  }
  
  if (ballPosition.y - ballDiameter / 2 <= 0) {
    direction.y *= -1;
  }
  
}

void checkCollisionWithPlayer() {
  
  if ((ballPosition.y + ballDiameter / 2) >= (playerPosition.y - playerSize.y / 2)) {
    
    if (ballPosition.y - ballDiameter / 2) <= (playerPosition.y + playerSize.y / 2)) {
      
      if ((ballPosition.x + ballDiameter / 2) >= (playerPosition.x - playerSize.x / 2)) {
          
        if ((ballPosition.x - ballDiameter / 2) <= (playerPosition.x + playerSize.x / 2)) {
           direction.y *= -1;
        }
      
      }
    
    }
    
  }
  
}

void checkInput() {
  
  if (keyPressed == true) {
    
      if(key == CODED) {
    
        if(keyCode == LEFT) {
          playerPosition.x -= playerVelocity;
        }
    
        if (keyCode == RIGHT) {
          playerPosition.x += playerVelocity;
        }
  
      }
  
  }

}

//void keyPressed() {
  
//  if(key == CODED) {
    
//    if(keyCode == LEFT) {
//      playerPosition.x -= playerVelocity;
//    }
    
//    if (keyCode == RIGHT) {
//      playerPosition.x += playerVelocity;
//    }
  
//  }
//}
