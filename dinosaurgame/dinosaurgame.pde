final static short YOSHI_SIZE = 70, SPEED = 7;
final static short FLOOR = 300, JUMP = 200;

PImage[] yoshi = new PImage[8];
static int dir, y = FLOOR;
int x = 60;

void setup() {
  size(600, 600);
  background (255);
  yoshi[0] = loadImage( "Y0.jpg" );
  yoshi[1] = loadImage( "Y1.jpg" );
  yoshi[2] = loadImage( "Y2.jpg" );
  yoshi[3] = loadImage( "Y3.jpg" );
  yoshi[4] = loadImage( "Y4.jpg" );
  yoshi[5] = loadImage( "Y5.jpg" );
  yoshi[6] = loadImage( "Y6.jpg" );
  yoshi[7] = loadImage( "Y7.jpg" );
   frameRate( 30 );
}

void draw() {
  background(255);
  if (dir != 0)  move();
  image( yoshi[frameCount%8], x, y, YOSHI_SIZE, YOSHI_SIZE );
  //rect(x, y, YOSHI_SIZE, YOSHI_SIZE);
}

void keyPressed() {
  if (dir == 0) {
    dir = -SPEED;
  }
}

void mousePressed() {
  keyPressed();
}

static void move() {
  if ((y += dir) < JUMP) {  
    dir *= -1;
  } else if (y > FLOOR) {
    dir = 0;
    y = FLOOR;
  }
}
