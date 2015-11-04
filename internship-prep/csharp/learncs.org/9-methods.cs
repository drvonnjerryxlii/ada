using System;

public class Methods
{
    public static void Main()
    {

        int x = 2;
        int y = 2;
        int a = Foo(x,y);
        Console.WriteLine(a);

    }

    //write method foo here
    public static int Foo(int a, int b)
    { // hmm, this doesn't handle for 3 / 2 => 1.5 :'(
        return a / b;
    }
}
