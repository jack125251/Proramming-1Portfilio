// Jack Wakefield | Feb 1, 2023 | Computer Programming 2
// Import Statements
import java.util.Random;
import java.util.Scanner;

// Setup class and main method
class NumberGame {
  public static void main(String[] args) {
    // Create random number, guess number and attempt number
    Random random = new Random();
    Scanner scanner = new Scanner(System.in);
    int guess;
    int attempt = 0;
    String again;
    boolean play = true;

    while (play == true) {
      int number = random.nextInt(0, 101);
      attempt = 0;
      // Welcome statement & prompt imput
      System.out.println("Welcome to the guessing game! Guess a number between 1 and 100.\nEnter input:");
      // Scan for guess number
      guess = scanner.nextInt();
      // If statements for guess number
      while (guess != number) {
        if (guess > number && guess < 101) {
          attempt++;
          System.out.println("You guessed " + guess + ". That number is too HIGH, try again.\nEnter input:");
          guess = scanner.nextInt();
        } else if (guess < number && guess > 0) {
          attempt++;
          System.out.println("You guessed " + guess + ". That number is too LOW, try again.\nEnter input:");
          guess = scanner.nextInt();
        } else if (guess < 1 || guess > 100) {
          System.out.println("Oops that number in not between 1 and 100. Try again.\nEnter input:");
          guess = scanner.nextInt();
        }
      }
      if (guess == number) {
        attempt++;
        System.out.println("You guessed " + guess + ". That's it. You guessed the number in " + attempt + " attempts.");
        break;
        }
    System.out.println("Play again?\nEnter [y/n] to play again:");
    again = scanner.nextLine();
    if (again.equalsIgnoreCase("y")) {
      play = true;
      } else if (again.equalsIgnoreCase("n")) {
      play = false;
      }
    }
  scanner.close();
  }
}
