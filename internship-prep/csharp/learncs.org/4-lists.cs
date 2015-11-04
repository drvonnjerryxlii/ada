public class Hello
{
    public static void Main()
    {
        // TODO: add your code here
        List<int> primeNumbers = new List<int>();
        int[] almostPrimes = { 1, 2, 3, 4, 5, 6, 7 };
        primeNumbers.AddRange(almostPrimes);
        primeNumbers.Remove(4);
        primeNumbers.Remove(6);

        // test code
        Console.WriteLine(primeNumbers.Count);
        Console.WriteLine(primeNumbers[0]);
        Console.WriteLine(primeNumbers[1]);
        Console.WriteLine(primeNumbers[2]);
        Console.WriteLine(primeNumbers[3]);
        Console.WriteLine(primeNumbers[4]);

    }
}
