class ImageController {
  
  PImage playerEmpty;
  PImage player1;
  PImage player2;
  PImage player3;
  PImage enemy;
  PImage ball;
  
  ImageController() {
    playerEmpty = loadImage("PlayerEmpty.png");
    player1 = loadImage("Player1.png");
    player2 = loadImage("Player2.png");
    player3 = loadImage("Player3.png");
    enemy = loadImage("Enemy.png");

    ball = loadImage("Ball.png");
  }
  
}
