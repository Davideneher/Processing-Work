class Bullet {
  int bulletXpos;
  int bulletYpos;
  int bulletYSpeed = 10;
  int count = 0;
  int death = 0;


  Bullet(int bulletStartX, int bulletStartY) {
    bulletXpos = bulletStartX;
    bulletYpos = bulletStartY;
    //bulletSpeed = speed;
    bullet = loadImage("bullet.png");
  }

  void move() {
    bulletYpos -= bulletYSpeed;
  }

  void draw() {
    imageMode(CORNER);
    image(bullet, bulletXpos, bulletYpos, P_WIDTH, P_HEIGHT);
  }

  void collide(Alien[] aliens) {
    for (Alien alien : aliens) {
      if (alien.y + A_HEIGHT >= bulletYpos && alien.y <= bulletYpos
        && alien.x - 5 <= bulletXpos && alien.x + A_WIDTH + 5 >= bulletXpos) {
        alien.explode();


        count = int(random(2, 30));

        if (count==5) {
          if (millis() > time + 1000) {
            powerups.add(new Powerup(alien.x, alien.y, (int)random(3)));
          }
        }
      }
    }
  }

  void bulletDestroy() {
    if (bulletYpos <= 0 - B_HEIGHT) {
      bulletDestroyer = bullets.indexOf(bullet);
    }      
    if (bulletDestroyer != -1) {
      bullets.remove(bulletDestroyer);
      bulletDestroyer = -1;
    }
  }
  void bulletMoveSpecial() {

    float bulletYSpeed = random(4, 10);
    float bulletXSpeed = random(5, 7);


    bulletXpos  += bulletXSpeed;
    bulletXpos  += bulletYSpeed;
  }
}
