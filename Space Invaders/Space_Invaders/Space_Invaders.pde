import java.util.Arrays;
import processing.sound.*;


Alien aliens[];
Player thePlayer;
ArrayList<Bullet> bullets;
ArrayList<Powerup> powerups;
Barrier[] barriers;

PImage spacer;
PImage background;
PImage explode;
PImage spacer4;
PImage player;
PImage bullet;
PImage bomb;
int bulletDestroyer;
int time = 0;
int time1 = 0;
int xposB;
int yposB;
SinOsc sine;
SoundFile pew;
SoundFile scream;

Reverb reverb;

void setup() {

  size(700, 700);
  textSize(100);
  pew = new SoundFile(this, "pew.mp3");
  scream = new SoundFile(this, "scream.mp3");
  sine = new SinOsc(this);
  //sine.play();


  thePlayer = new Player(600);
  aliens = new Alien[10];
  bullets = new ArrayList<Bullet>();
  powerups = new ArrayList<Powerup>();
  barriers = new Barrier[16];
  initArray(aliens);
  initBarrier(barriers);

  background = loadImage("background.jpg");
  background(background);
  bulletDestroyer = -1;
  time=millis();
}

void draw() {
  thePlayer.move(mouseX);
  background(background);
  moveArray(aliens);
  drawArray(aliens);
  drawBarrier(barriers);

  for (Bullet bullet : bullets) {
    bullet.move();
    bullet.draw();
    bullet.bulletDestroy();
    bullet.collide(aliens);
  }
  for (Powerup powerup : powerups) {

    powerup.move();
    powerup.draw();
    powerup.collide(thePlayer);
  }

  for (Alien a : aliens) {
    thePlayer.draw();
    if (a.hasBomb  && !a.bomb.collide(thePlayer)) {
      a.bomb.draw();
      a.bomb.move();
    } else if (a.bomb.bombYpos >= 600) {
      text("You died", width-550, height/2);
      thePlayer.drawExploded();
      sine.play();
    }

    for (Barrier b : barriers) {
      b.bombCollide(a.bomb);
    }
  }
  if (aliensDead(aliens))
  {
    text("You Win!", width-550, height/2);
  }
}
void mousePressed() {
  if (millis() > time + 1000)
  {
    pew.play();
    reverb = new Reverb(this);
    reverb.process(pew);


    bullets.add(new Bullet(thePlayer.playerXpos + 21, 600));
    bullets.add(new Bullet(thePlayer.playerXpos - 19, 600));
    time = millis();
  }
}

void initArray (Alien alienArray[]) {
  for (int i=0; i < alienArray.length; i++)
  {
    if (i==6)
    {
      alienArray[i] = new Alien(i * 80, 0, true);
    } else
    {
      alienArray[i] = new Alien(i * 80, 0, false);
    }
  }
}

void drawArray(Alien alienArray[]) {
  for (int i = 0; i < alienArray.length; i++)
  {
    //alienArray[i].getBomb();
    //if (alienArray[i].bomb.collide(thePlayer)) {
    //text("You died", width/2, height/2);} 
    //else {
    //alienArray[i].bomb.draw();
    //alienArray[i].bomb.move();
    //}
    if (i!=6)
    {
      alienArray[i].draw();
    } else
    {
      alienArray[i].drawBoss();
    }
  }
}



void moveArray(Alien alienArray[]) {  
  for (int i = 0; i < alienArray.length; i++)
  {
    if (alienArray[i].boss)
    {
      alienArray[i].moveBoss();
    }
    alienArray[i].move();
  }
}

void initBarrier(Barrier barrierArray[]) {

  for (int i=0; i < barrierArray.length; i++)
  {
    if (i%2==0) {

      int yposB = height   - 200;
      barrierArray[i] = new Barrier(i*5 + 50, yposB);
    } else {
      int yposB = height   - 200;
      barrierArray[i] = new Barrier(i*5 + 550, yposB);
    }
  }
}
void drawBarrier(Barrier barrierArray[]) {
  for (int i =0; i < barrierArray.length; i++) {
    barrierArray[i].draw();
    barrierArray[i].bulletCollide(bullets);
  }
}

boolean aliensDead(Alien aliens[])
{
  boolean allDead[] = new boolean[aliens.length - 4];
  Arrays.fill(allDead, false);
  for (int i = 0; i<aliens.length - 4; i ++)
  {
    if ( aliens[i].dead )
    {
      allDead[i] = true;
    }
  }   
  for (boolean b : allDead) if (!b) return false;
  return true;
}
