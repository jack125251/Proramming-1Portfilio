class PowerUp {
  int x, y, diam, speed, type;
  PImage health, ammo;

  // Constructor
  PowerUp() {
    x = int(random(50, 750));
    y = -50;
    speed = 3;
    diam = 50;
    health = loadImage("health.png");
    ammo = loadImage("ammo.png");
    if (random(1, 2)<1.5) {
      type = 'H';
    } else {
      type = 'A';
    }
  }

  void display() {
    imageMode(CENTER);
    if (type == 'H') {
      //fill(0, 222, 0);
      image(health,x,y,diam,diam);
    } else {
      fill(222, 222, 0);
      image(ammo,x,y,diam,diam);
    }
    //ellipse(x, y, diam, diam);
    //fill(1);
    //textAlign(CENTER);
    //text(type, x, y);
  }

  void move() {
    y+= speed;
  }

  boolean reachedBottom() {
    if (y>height+100) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Ship ship) {
    float d = dist(x, y, ship.x, ship.y);
    if (d<90) {
      return true;
    } else {
      return false;
    }
  }
}
