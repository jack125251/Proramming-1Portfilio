import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scan = new Scanner(System.in);
    int shape;
    Box b1 = new Box();
    Pyramid p1 = new Pyramid();
    Sphere s1 = new Sphere();
    double val = 0.0;
    boolean play = true;

    while (play) {
    System.out.println("Welcome to shape tester!");
    System.out.println("Select a shape by entering the correlating number.\nBox = 1\nPyramid = 2\nSphere = 3\nSelect a shape:");
    shape = scan.nextInt();

    if (shape==1) {
      System.out.println("You have selected box.\nEnter box length:");
      val = scan.nextDouble();
      b1.setL(val);

      System.out.println("Enter box width:");
      val = scan.nextDouble();
      b1.setW(val);

      System.out.println("Enter box height:");
      val = scan.nextDouble();
      b1.setH(val);

      System.out.println("Volume: " + b1.calcVol());
      System.out.println("Surface Area: " + b1.calcSurfArea());
    } else if (shape==2) {
      System.out.println("You have selected pyramid.\nEnter pyramid base length:");
      val = scan.nextDouble();
      p1.setL(val);
      
      System.out.println("Enter pyramid base width:");
      val = scan.nextDouble();
      p1.setW(val);
      
      System.out.println("Enter pyramid height:");
      val = scan.nextDouble();
      p1.setH(val);

      System.out.println("Volume: " + p1.calcVol());
      System.out.println("Surface Area: " + p1.calcSurfArea());
    } else if (shape==3) {
      System.out.println("You have selected sphere.\nEnter sphere radius:");
      val = scan.nextDouble();
      s1.setR(val);

      System.out.println("Volume: " + s1.calcVol());
      System.out.println("Surface Area: " + s1.calcSurfArea());
    } else {
      System.out.println("This number is not within the parameters. Try again:");
      // Allow user to select another shape
      shape = scan.nextInt();
    }
    break;
  }
  scan.close();
  }
}
