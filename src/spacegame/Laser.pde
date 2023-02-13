class Laser {
  int x,y,w,h,speed;
  PImage laser;
  
  // Constructor
  Laser(int x, int y) {
    this.x = x;
    this.y = y;
    w = 3;
    h = 25;
    speed = 19;
    laser = loadImage("BLaser2.png");
  }
  
  void display() {
    imageMode(CENTER);
    image(laser,x,y);
  }
  
  void move() {
    y-= speed;
  }
  
  boolean reachedTop() {
    if(y<0) {
      return true;
    } else {
      return false;
    }
  } 
  boolean intersect(Rock rock) {
    float d = dist(x,y,rock.x,rock.y);
    if(d<rock.diam/2.5) {
      return true;
    } else {
      return false;
    }
  }
}
