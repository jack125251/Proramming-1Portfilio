class Ship {
  int x, y, w, ammo, turretCount, health;
  PImage ship1;

  Ship() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 100;
    turretCount = 2;
    health = 250;
    ship1 = loadImage("OldShip.png");
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    imageMode(CENTER);
    image(ship1, x, y);
  }

  void move() {
  }

  boolean fire() {
    if(ammo>0) {
      ammo--;
      return true;
    } else {
      return false;
    }
  }
  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x,rock.y);
    if(d<rock.diam*1) {
      return true;
    } else {
      return false;
    }
  }
}
