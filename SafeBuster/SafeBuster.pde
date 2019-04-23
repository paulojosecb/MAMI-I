GameController gameController;

void setup() {
   size(800, 600);
   gameController = new GameController();
}

void draw() {
  background(0); 
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
