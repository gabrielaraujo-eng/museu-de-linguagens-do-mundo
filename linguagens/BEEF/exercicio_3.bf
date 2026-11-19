using System;
namespace Hello;

class Program
{
    public static int Main()
    {
        int value = 2;
        switch (value)
        {
            case 1: Console.WriteLine("Um");
            case 2: Console.WriteLine("Dois");
            default: Console.WriteLine("Outro valor");
        }
        return 0;
    }
}
