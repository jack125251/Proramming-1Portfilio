class Star{
  int x,y,diam,speed;
  
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(2,4));
    speed = int(random(2,5));
  }
  
  void display() {
    noStroke();
    fill(255);
    circle(x,y,diam);
  }
  
  void move() {
    if(y>height+10) {
      y = -10;
    } else {
      y+= speed;
    }
  }
  
  boolean reachedBottom() {
    return true;
  }
}
