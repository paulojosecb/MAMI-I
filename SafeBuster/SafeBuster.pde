GameController gameController;

void setup() {
   size(800, 600);
   gameController = new GameController();
}

void draw() {
  background(0); 
  gameController.update();
}
