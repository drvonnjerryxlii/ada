public class Hello
{
    public static void Main()
    {
        // TODO: add the inventory dictionary here
        Dictionary<string, int> inventory = new Dictionary<string, int>();
        inventory["apple"] = 3;
        inventory["orange"] = 5;
        inventory.Add("banana", 2);

        Console.WriteLine(inventory["apple"]);
        Console.WriteLine(inventory["orange"]);
        Console.WriteLine(inventory["banana"]);

    }
}
