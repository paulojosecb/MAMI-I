PImage left;
PImage right;
PImage up;
PImage down;

PImage currentSprite;

PVector position; 
float speed = 10;
String direction = "idle";

void setup() {
  size(400, 400); 
  position = new PVector(width/2, height/2);
  
  left = loadImage("left.png");
  right = loadImage("right.png");
  up = loadImage("up.png");
  down = loadImage("down.png");
  
  currentSprite = right;
}

void draw() {
  clear();
  background(0);
  
  switch (direction) {
    
   case "up":
     position.y -= speed;
     currentSprite = up;
     break;
   case "down":
     position.y += speed;
     currentSprite = down;
     break;
   case "left":
     position.x -= speed;
     currentSprite = left;
     break;
   case "right":
     position.x += speed;
     currentSprite = right;
     break;
    default:
      break;
  }
  
  image(currentSprite, position.x, position.y);

}

void keyPressed() {

   if (key == CODED) {
   
     if (keyCode == UP) {
       direction = "up";
     }
     
     if (keyCode == DOWN) {
       direction = "down";
     }
     
     if (keyCode == LEFT) {
       direction = "left";
     }
     
     if (keyCode == RIGHT) {
       direction = "right";
     }
     
   }
   
}

void keyReleased() {
   direction = "idle";
}
