Player thePlayer;
Player computer;
Ball theBall;
int time = 0;
int livesP = 3;
int livesC = 3;



void settings() {
  size(SCREENX, SCREENY);
}
void setup() {
  
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  computer = new Player(MARGIN);
  theBall = new Ball();
  ellipseMode(RADIUS);
  computer.speed = 2;
  colorMode(HSB, 360, 100, 100);
  textSize(60);
  time=millis();
}
void draw() {
  background(0);
  
  theBall.move();
  computerMove();
  thePlayer.move(mouseX);

  theBall.collideP(thePlayer);
  theBall.collideC(computer);
    theBall.collideWalls();


  computer.draw();
  thePlayer.draw();
  theBall.draw();

  death();
}

void computerMove()
{

  if (computer.xpos > SCREENX-PADDLEWIDTH) computer.xpos = SCREENX-PADDLEWIDTH;
  if (computer.xpos < theBall.x) computer.xpos += computer.speed;
  if (computer.xpos  > theBall.x) computer.xpos -= computer.speed;

  if (millis() > time + 100) {
     computer.speed *= 1.008;
    time = millis();
  }
  textSize(30);
  text("Computer speed: " + computer.speed, SCREENX - 309, 70);
  text("Ball speed:           " + abs(theBall.speedY), SCREENX - 309, 150);
  textSize(60);
}

void mousePressed() {
  loop();
}

void reset()
{
  if (theBall.y < MARGIN + PADDLEHEIGHT - 8) {
    livesC--;
    resetSetup();
  } else if (theBall.y > SCREENY - (MARGIN + PADDLEHEIGHT - 8)) {
    livesP--;
    resetSetup();
    noLoop();
  }
}
void resetSetup() {
  thePlayer = new Player(SCREENY-(MARGIN+PADDLEHEIGHT));
  computer = new Player(MARGIN);
  theBall = new Ball();
  background(0);
  thePlayer.draw();
  computer.draw();
  theBall.draw();
  time = millis();
  computer.speed = 2;
  noLoop();
}
void death() {
  reset();
  fill(234, 98, 84);
  text(livesP, SCREENX/2, SCREENY - 100);
  fill(358, 99, 89);
  text(livesC, SCREENX/2, SCREENY - 426); 

  if (livesP == 0) {
    textSize(95);
    fill(358, 99, 89);
    text("YOU LOSE NOOB", 1, SCREENY/2);
    reset();
    textSize(60);
    livesC = 3;
    livesP = 3;
  } else if (livesC == 0) {
    textSize(95);
    fill(234, 98, 84);
    text("WOW YOU WON!", 10, SCREENY/2);
    textSize(60);
    reset();
    livesC = 3;
    livesP = 3;
  }
}
