using System;
namespace Hello;

class Program
{
    public static int Main()
    {
        int squared = Square(4);
        Console.WriteLine("{}", squared);
        return 0;
    }

    static int Square(int n) => n * n;
}
