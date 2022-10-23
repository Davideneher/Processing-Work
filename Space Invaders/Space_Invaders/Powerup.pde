class Powerup {
  float powerupXpos;
  float powerupYpos;
  int powerupSpeed = 5;
  int powerupDestroyer = -1;
  int powerupType;
  Powerup(float powerupStartX, float powerupStartY, int randomNumber)
  {
    powerupXpos = powerupStartX;
    powerupYpos = powerupStartY;
    powerupType = randomNumber + 1;
  }

  void move() {
    powerupYpos += powerupSpeed;
  }

  void collide(Player player) {
    if (player.playerYpos + P_HEIGHT >= powerupYpos
      && player.playerYpos <= powerupYpos
      && player.playerXpos <= powerupXpos && player.playerXpos + P_HEIGHT >= powerupXpos) {

      if (powerupType == 1) {
        for (Bullet bullet : bullets) {
          bullet.bulletYSpeed = 30;
        }
      } else if (powerupType == 2) {
        for (Bullet bullet : bullets) {
          bullet.bulletMoveSpecial();
        }
      } else if (powerupType == 3) {
        bullets.add(new Bullet(thePlayer.playerXpos + 19, 500));
        bullets.add(new Bullet(thePlayer.playerXpos - 19, 500));
        bullets.add(new Bullet(thePlayer.playerXpos + 19, 450));
        bullets.add(new Bullet(thePlayer.playerXpos - 19, 450));
 
      }
    powerupDestroyer = bullets.indexOf(bullet);
    if (powerupDestroyer != -1) {
      powerups.remove(powerupDestroyer);
      powerupDestroyer = -1;
  }
    
    }
  }


  void draw() {
    switch(powerupType) {
    case 1:
      fill(255, 0, 0);
      ellipse(powerupXpos, powerupYpos, 20, 20);
      break;
    case 2:
      fill(0, 255, 0);
      ellipse(powerupXpos, powerupYpos, 20, 20);
      break;
    case 3:
      fill(0, 0, 255);
      ellipse(powerupXpos, powerupYpos, 20, 20);
      break;
    }
  }
}
