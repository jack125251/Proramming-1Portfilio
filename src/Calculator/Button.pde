class Button {
  // Member Variables
  int x, y, w, h;
  char val;
  color c1, c2;
  boolean on, m;

  // Constructor
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#606370);
    c2 = color(#3B3D44);
    on = false;
  }

  // Member Methods
  void display() {
    if (on) {
      fill(c2);
      m=true;
    } else {
      fill(c1);
    }
    rect(x, y, w, h, 8);
    fill(#F7F7F6);
    textSize(18);
    textAlign(CENTER, CENTER);
    text(val, x+30, y+20);
  }

  void hover(int mx, int my) {
    on = (mx > x && mx < x+w && my > y && my < y+h);
  }
}
