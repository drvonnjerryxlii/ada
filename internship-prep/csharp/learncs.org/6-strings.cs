using System;

public class Hello
{
    public static void Main()
    {
        string firstName = "John";
        string lastName = "Doe";
        int age = 27;

        // TODO: change this
        string sentence = String.Format(
            "{0} {1} is {2} years old.",
            firstName,
            lastName,
            age
        );

        Console.WriteLine(sentence);

    }
}
