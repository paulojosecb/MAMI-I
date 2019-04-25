enum JumpState {
  IDLE, JUMPING
}

enum HammeringState {
  IDLE, HAMMERING
}

JumpState jumpState;
HammeringState hammeringState;

float hammeringTimer;
float HAMMERING_MAX_TIMER = 30;

PVector position;

float gravity = 1;
float acceleration = 0;
float velocity = 0;


void setup() {
  size(600, 600);
  position = new PVector(width/2, height - 25);
  jumpState = JumpState.IDLE;
}

void draw() {
  clear();
  background(0);
  
  if (jumpState == JumpState.JUMPING) {
    move();
  }
  
  if (hammeringState == HammeringState.HAMMERING) {
    hammeringTimer++;
    
    if (hammeringTimer > HAMMERING_MAX_TIMER) {
      hammeringTimer = 0;
      hammeringState = HammeringState.IDLE;
    }
  }   //<>// //<>//
  
  if (hammeringState == HammeringState.HAMMERING) {
    fill(255, 0, 0);
  } else {
    fill(255);
  }
  
  rectMode(CENTER);
  rect(position.x, position.y, 50, 50);
}

void keyPressed() {

  if ((key == CODED) && (keyCode == UP)) {
    velocity = -20;
    jumpState = JumpState.JUMPING;
  }
  
  if (key == ENTER) {
    hammeringState = HammeringState.HAMMERING;
  }
  
}

void move() {
  position.y += velocity;
  velocity += gravity;
  
  if (position.y >= height - 25) {
    jumpState = JumpState.IDLE;
  }
}
