// For this assignment, you will create the pattern of a chess board that is
// 8 x 8.  Use X and O to represent the squares.

// Create the appropriate nested looping structure to output the characters in
// an 8 x 8 grid on the screen using Console.Write() or Console.WriteLine() as
// appropriate.

// Include a decision structure to ensure that alternate rows start with
// opposite characters as a real chess board alternates the colors among rows.

// This is what your output should look like.

// XOXOXOXO
// OXOXOXOX
// XOXOXOXO
// OXOXOXOX
// XOXOXOXO
// OXOXOXOX
// XOXOXOXO
// OXOXOXOX

// Grading Criteria:
// - Used a nested loop
// - Used a decision structure to flip row output
// - Output is correct per above image

using System;

public class Module2
{
  public static void Main()
  {
    DrawBoard(8);
  }

  public static void DrawBoard(int size)
  {
    for (int row = 0; row < size; row++) {
      // initialize empty string for current row
      string currentRow = String.Empty;

      // add "X"s and "O"s as appropriate until end of row
      if (row % 2 == 0)
      {
        // start with "X"s on even rows
        for (int col = 0; col < size; col++)
          currentRow += col % 2 == 0 ? "X" : "O";
      }
      else
      {
        // start with "O"s on odd rows
        for (int col = 0; col < size; col++)
          currentRow += col % 2 == 0 ? "O" : "X";
      }

      // write the current row to the console
      Console.WriteLine(currentRow);
    }
  }
}
