class Ball {
  float x; 
  float y; 
  float speedX; 
  float speedY;
  int radius;
  int ballColor = 360;
  float angle;
  Ball() {
    x = random(SCREENX/4, SCREENX/2);
    y = (SCREENY/2);
    float angle = random(PI/3, (2*PI)/3);
    speedX = 5 * cos(angle);
    speedY = 5 * sin(angle);
    radius = 10;
  }
  void move() {
    x = x + speedX;
    y = y + speedY;
    
    
  }
  void draw() {
    ballColor--;
    if (ballColor==0)ballColor=360;
    fill(ballColor, 255, 255);
    ellipse(int(x), int(y), radius, 
      radius);
  }
  void collideP(Player tp) {
    if (y + radius >= tp.ypos 
      && y - radius < tp.ypos + PADDLEHEIGHT 
      && x >= tp.xpos 
      && x <= tp.xpos + PADDLEWIDTH) {
      speedY =- 1.01*speedY;
      speedX += 0.1*tp.speed;
      /*/if ( y > tp.ypos) {
       float diff = x - (tp.xpos - PADDLEWIDTH/2);
       float rad125 = radians(135);
       float rad55 = radians(35);
       float angle = map(diff, 0, PADDLEWIDTH/2, rad125, rad55);
       speedX = 5 * cos(angle);
       speedY = 5 * sin(angle);
       }
       println(computer.speed);/*/
    }
  }

  void collideC(Player cp) {
    if (y - radius <= cp.ypos + PADDLEHEIGHT 
      && y - radius >= cp.ypos 
      && x >= cp.xpos 
      && x <= cp.xpos + PADDLEWIDTH) {

      speedY =- 1.01*speedY;
      speedX += 0.3*cp.speed;

      /*/ if ( y < cp.ypos) {
       float diff = x - (cp.xpos - PADDLEWIDTH/2);
       float rad245 = radians(245);
       float rad285 = radians(285);
       float angle = map(diff, 0, PADDLEWIDTH/2, rad245, rad285);
       speedX = 5 * cos(angle);
       speedY = 5 * sin(angle);
       speedX += 0.1*cp.speed;
       }/*/
    }
  }

  void collideWalls()
  {
    if (x-radius <=0) speedX=-speedX;
    else if (x+radius>=SCREENX) speedX=-speedX;
  }
}
