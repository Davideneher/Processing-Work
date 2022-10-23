class Alien {
  int exploded; 
  float x; 
  float y; 
  int count;
  int heightDiff = A_HEIGHT + 10;
  float direction = 1;
  int time = 0;
  int time1 = 0;
  float dy; 
  float bossDirection; 
  boolean boss;
  int powerups;
  Bomb bomb;
  boolean hasBomb;
  boolean dead = false;


  Alien(int xpos, float ypos, boolean isboss) {
    hasBomb = false;
    x = xpos; 
    y = ypos; 
    boss = isboss;
    dy = 0.7;
    spacer = loadImage("spacer.gif");
    explode = loadImage("exploding.gif");
    spacer4 = loadImage("boss.gif");
    time = millis();
    bomb = new Bomb(x, y);
  }

  void move() {
    if (exploded<1) {
      if ((x + A_WIDTH >= width) || x<0) {
        if (count<heightDiff) {
          y++;
          count++;
        } else {
          direction*=-1;
          x+=direction;
          count = 0;
        }
      } else {
        x += direction;
      }
      if (millis() > time + 1000) {
        direction *= 1.03;
        time = millis();
      }
    }
  }

  void explode() {

    if (exploded==0) {
      int toExplode = int(random(0, 2));
      if (toExplode<1) {
        exploded = 1;
        dead = true;
        scream.play();
      } else {
        exploded = 0;
      }
    }
  }

  void moveBoss() {
    if (true) {
      if (exploded<1) {
        if ((x + B_WIDTH + 30 >= width) || x<0) {
          if (count<heightDiff) {
            y++;
            count++;
          } else {
            direction*=-1;
            x+=direction;
            count = 0;
          };
        } else {
          x += direction;
          y += 0.3;
        }

        if (millis() > time + 3000) {
          direction *= -1.02;
          y*=1.7;
          time = millis();
        }
      }
    }
  }
  void drawBoss() {
    if (exploded>=1  && exploded< 30) {
      image(explode, x, y, A_WIDTH + 150, A_HEIGHT + 150);
      exploded++;
    } else if (exploded == 70) {
      x=3000;
    } else if (exploded==0) { 
      if (true) {
        image(spacer4, x, y, B_WIDTH, B_HEIGHT);
      }
    }
  }
  void getBomb() {
    if (hasBomb == true) {
      bomb = new Bomb(x, y);
      bomb.move();
      bomb.draw();
      bomb.collide(thePlayer);
      bomb.offScreen();
    }
  }
  void draw() {

    imageMode(CORNER);
    if (exploded>=1  && exploded< 70) {
      image(explode, x, y, A_WIDTH + 10, A_HEIGHT + 10);
      exploded++;
    } else if (exploded == 70) {
      x=3000;
    } else if (exploded==0) {        
      image(spacer, x, y, A_WIDTH, A_HEIGHT);
      if ((int)random(500) == 1) {
        if (!bomb.offScreen()) {
          hasBomb = true;
        }
      }
    }
  }
}
