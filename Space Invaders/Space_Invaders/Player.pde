class Player {
  int playerXpos; 
  int playerYpos;

  Player(int screen_y)
  {
    
    player = loadImage("player.png");
    playerXpos = width/2;
    playerYpos = screen_y;
  }

  void move(int x) {
    if (x>width-P_WIDTH) playerXpos = width-P_WIDTH;
    else playerXpos=x;
  }
 
  void draw()
  {
    imageMode(CORNER);
    image(player, playerXpos, playerYpos, P_WIDTH, P_HEIGHT);
  }
  void drawExploded()
  {
    image(explode, playerXpos, playerYpos, P_WIDTH, P_HEIGHT);
  }
}
