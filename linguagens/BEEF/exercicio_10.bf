using System;
namespace Hello;

class Counter
{
    public int Value = 4;
}

extension Counter
{
    public int DoubleValue() => Value * 2;
}

class Program
{
    public static int Main()
    {
        Counter counter = new .();
        Console.WriteLine("{}", counter.DoubleValue());
        return 0;
    }
}
