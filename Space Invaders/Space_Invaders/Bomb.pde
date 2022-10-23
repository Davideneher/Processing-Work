class Bomb {
  float bombXpos;
  float bombYpos;  
  int bombYSpeed = 3;
  Bomb(float bombStartX, float bombStartY) {

    bombXpos = bombStartX;
    bombYpos = bombStartY;
    bomb = loadImage("bomb.png");
  }

  boolean offScreen()
  {
    if (bombYpos + BB_HEIGHT == height)return true;
    return false;
  }

  boolean collide(Player player) {
    if (player.playerYpos + P_HEIGHT >= bombYpos
      && player.playerYpos <= bombYpos
      && player.playerXpos <= bombXpos && player.playerXpos + P_HEIGHT >= bombXpos)
    {
      return true;
    }
    return false;
  }

  void move() {
    bombYpos += bombYSpeed;
  }
  void draw() {
    imageMode(CORNER);
    image(bomb, bombXpos, bombYpos, BB_WIDTH, BB_HEIGHT);
  }
}
