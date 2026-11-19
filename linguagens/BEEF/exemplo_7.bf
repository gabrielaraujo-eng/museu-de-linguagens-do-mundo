using System;
namespace Hello;

class Program
{
    public static int Main()
    {
        switch (GetMinusOne(1))
        {
            case .Ok(let value): Console.WriteLine("Valor: {}", value);
            case .Err: Console.WriteLine("Falha");
        }
        return 0;
    }

    static Result<uint> GetMinusOne(uint value)
    {
        if (value == 0)
            return .Err;
        return .Ok(value - 1);
    }
}
