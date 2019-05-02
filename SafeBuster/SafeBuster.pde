GameController gameController;
PImage background;

void setup() {
   size(800, 600);
   gameController = new GameController();
   background = loadImage("Background.png");
}

void draw() {
  background(0); 
  image(background, 0, 0);
  gameController.update();
}

void keyPressed() {
  
  if (key == CODED) {
    
    if (keyCode == LEFT) {
      gameController.player.move(-1);
    } else if (keyCode == RIGHT) {
      gameController.player.move(1);
    }
  
  }

}
