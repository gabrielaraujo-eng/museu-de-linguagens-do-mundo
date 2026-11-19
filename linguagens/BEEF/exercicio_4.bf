using System;
namespace Hello;

class Program
{
    public static int Main()
    {
        int value = 3;
        while (value > 0)
        {
            Console.WriteLine("{}", value);
            value--;
        }
        return 0;
    }
}
