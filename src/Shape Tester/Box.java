public class Box {
  // Member Variables
  private double l;
  private double w;
  private double h;

  // Constructor
  public Box() {
    l = 0;
    w = 0;
    h = 0;
  }
  
  // Set Methods
  public void setL(double l) {
    this.l = l;
  }
  public void setW(double w) {
    this.w = w;
  }
  public void setH(double h) {
    this.h = h;
  }
  
  // Calculation Methods
  public double calcVol() {
    double vol = l*w*h;
    return vol;
  }

  public double calcSurfArea() {
    double sa = 2*(l)*(w)+2*(l)*(h)+2*(h)*(w);
    return sa;
  }
}
