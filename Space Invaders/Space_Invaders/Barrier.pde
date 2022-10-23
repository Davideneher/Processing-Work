class Barrier {
  float barrierXpos;
  float barrierYpos;

  Barrier(float xpos, float ypos) {

    barrierXpos = xpos;
    barrierYpos = ypos;
  }

  void bulletCollide(ArrayList<Bullet> bullets) {
    for (Bullet bullet : bullets)
    {
      if (bullet.bulletYpos + A_HEIGHT >= barrierYpos && bullet.bulletYpos <= barrierYpos
        && bullet.bulletXpos - 5 <= barrierXpos && bullet.bulletXpos + A_WIDTH + 5 >= barrierXpos) {
        barrierXpos = 20000;
        bullet.bulletXpos = 20000;
      }
    }
  }
  void bombCollide(Bomb bomb) {


    if (bomb.bombYpos + 30 >= barrierYpos && bomb.bombYpos <= barrierYpos + height
      && bomb.bombXpos + 15 >= barrierXpos && bomb.bombXpos <= barrierXpos + 11)
    {
      barrierXpos = 2000;
      bomb.bombXpos = 2000;
    }
  }

  void draw() {
    noStroke();
    rect(barrierXpos, barrierYpos, 10, 10);
  }
}
