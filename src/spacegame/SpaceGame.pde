// Jack Wakefield | Nov-Dec 2022 | SpaceGame
Ship s1;
Timer rockTimer, puTimer, lvTimer;
import processing.sound.*;
SoundFile laser, powerup;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
ArrayList<PowerUp> powerups = new ArrayList<PowerUp>();
Star[] stars = new Star [50];
int score, level;
boolean play;

void setup() {
  size(800, 800);
  //fullScreen();
  s1 = new Ship();
  puTimer = new Timer(10000);
  puTimer.start();
  rockTimer = new Timer(int(random(500, 1000)));
  rockTimer.start();
  // Levels
  lvTimer = new Timer(int(random(10)));
  lvTimer.start();


  for (int i=0; i<stars.length; i++) {
    stars[i] = new Star();
  }
  score = 0;
  level = 1;
  play = false;
}

void draw() {
  background(20, 0, 25);
  noCursor();

  if (!play) {
    startScreen();
  } else if (play) {


    // Rendering Stars
    for (int i=0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
    }

    // Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new PowerUp());
      puTimer.start();
      println("PowerUps:");
    }

    // Rendering PowerUps and Detecting Ship Collision
    for (int i = 0; i < powerups.size(); i++) {
      PowerUp pu = powerups.get(i);
      if (pu.intersect(s1)) {
        powerup = new SoundFile(this, "powerup.wav");
        powerup.play();
        if (pu.type == 'H') {
          s1.health+=15;
        } else {
          s1.ammo+=20;
        }
        powerups.remove(pu);
        // add a sound
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
      } else {
        pu.display();
        pu.move();
      }
    }

    // Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockTimer.start();
      lvTimer.start();
      println("Rocks:" + rocks.size());
    }
    //Rendering Rocks
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=r.diam;
        rocks.remove(r);
        // todo call explosion animation
        // add a sound for explosion
        // rock health
      }
      for (int j = 0; j < lasers.size(); j++) {
        Laser l = lasers.get(j);
        if (l.intersect(r)) {
          rocks.remove(r);
          lasers.remove(l);
          score+=100;
          // todo call explosion animation
          // add a sound for explosion
        }
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
      } else {
        r.display();
        r.move();
      }
    }


    // Render lasers ons the screen
    for (int i = 0; i < lasers.size(); i++) {
      Laser l = lasers.get(i);
      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }

    // Ship and Info Panel
    s1.display(mouseX, mouseY);
    infoPanel();

    if (s1.health<1) {
      gameOver();
    }
  }
}

void infoPanel() {
  fill(60, 200);
  rectMode(CORNER);
  rect(10, 670, 120, 120, 4);
  fill(200);
  textAlign(LEFT);
  textSize(18);
  text("Score: " + score + "\nAmmo: " + s1.ammo + "\nHealth: " + s1.health, 20, 700);
}

void mousePressed() {
  //lasers.add(new Laser(s1.x, s1.y));
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    laser = new SoundFile(this, "laser.wav");
    laser.play();
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-8, s1.y));
    lasers.add(new Laser(s1.x+8, s1.y));
    laser = new SoundFile(this, "laser.wav");
    laser.play();
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x-8, s1.y));
    lasers.add(new Laser(s1.x+8, s1.y));
    lasers.add(new Laser(s1.x+47, s1.y-20));
    lasers.add(new Laser(s1.x-47, s1.y-20));
    laser = new SoundFile(this, "laser.wav");
    laser.play();
    println("Lasers:" + lasers.size());
  }
}

void startScreen() {
  background(20, 0, 25);
  fill(255);
  textAlign(CENTER);
  textSize(20);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(20, 0, 25);
  fill(222);
  textAlign(CENTER);
  textSize(20);
  text ("GameOver!", width/2, height/2);
  text ("Score: " + score, width/2, height/2+30);
  play = false;
  noLoop();
}
