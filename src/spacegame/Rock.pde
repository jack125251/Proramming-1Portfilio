class Rock {
  int x,y,diam, speed;
  PImage rock;
  
  // Constructor
  Rock() {
    x = int(random(50,750));
    y = -50;
    speed = int(random(2,10));
    diam = int(random(50,100));
    rock = loadImage("rock.png");
  }

  
  void display() {
    imageMode(CENTER);
    image(rock,x,y, diam, diam);
  }
  
  void move() {
    y+= speed;
  }

  
  boolean reachedBottom() {
    if(y>height+100){
      return true;
    } else {
      return false;
    }
  }
}
