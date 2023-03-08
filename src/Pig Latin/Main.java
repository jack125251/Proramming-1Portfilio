import java.util.Scanner;

class Main {
  public static void main(String[] args) {
    Scanner scanner = new Scanner (System.in);
    String word;
    String lastPart;
    char firstLetter;

    // Welcome
    System.out.println("Enter a word to convert to PigLatin");
    word = scanner.nextLine();

    word = word.toLowerCase();
    word.length();
    firstLetter = word.charAt(0);
    lastPart = word.substring(1);
    
    System.out.println(word);
    System.out.println(lastPart+firstLetter+"a");
    
    scanner.close();
  }
}
