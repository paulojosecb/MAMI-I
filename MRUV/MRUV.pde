// Escala: 100PX = 1 metro

int positionX;
int positionY;
float velocityY;

float gravity = 9.8 * 100;
float currentTime = 0.0;

float initialVelocityX = 600;
float initialVelocityY = -300;
int initialPositionY = 600;

void setup() {
  size(600, 600);
  
  frameRate(60);

  positionX = 0;
  positionY = 600;
  velocityY = 0;

  background(0);
  
}

void draw() {
 
    clear();
    printVariables();
    
    positionX = int(mru(initialVelocityX, currentTime));
    positionY = int(mruv(initialPositionY, currentTime, initialVelocityY, gravity));
    velocityY = getVelocity(initialVelocityY, gravity, currentTime);
    
    fill(255);
    ellipse(positionX - 12, positionY - 12, 25, 25);
    
    currentTime = currentTime + 1.0/60.0;
  
}

float mru(float velocity, float time) {
  return velocity * time;
}

float mruv(int initialPosition, float time, float initialVelocity, float acceleration) {
  return initialPosition + initialVelocity * time + acceleration * time * time / 2.0;
}

float getVelocity(float initialVelocity, float acceleration, float time) {
  return initialVelocity + acceleration * time;
}

void printVariables() {
  String time = "CurrentTime: " + currentTime;
  text(time, 10, 10, 200, 50);
  text("Position X: " + positionX, 10, 30, 300, 50);
  text("Position Y: " + positionY, 10, 50, 300, 50);
  text("Velocity X: " + initialVelocityX, 10, 70, 300, 50); // Não varia pois a é a velocidade do MRU
  text("Velocity Y: " + velocityY , 10, 90, 300, 50);
}
