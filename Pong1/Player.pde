class Player {
  float xpos; 
  float ypos;
  float speed;
  float prevXPos;
  color paddlecolor = color(#08E6FC);
  //PImage paddle;
  
  Player(int screen_y)
  {
    xpos=SCREENX/2;
    ypos=screen_y;
    //paddle = loadImage("Blue_laser.png");
  }

  void move(float x) {
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else xpos=x;

    thePlayer.speed = thePlayer.xpos - thePlayer.prevXPos;
    thePlayer.prevXPos = thePlayer.xpos;
  }
  void draw()
  {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
      /*/imageMode(CORNER);
      image(paddle, xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);/*/
  }
}
