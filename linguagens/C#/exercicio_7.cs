using System;

// Lança uma exceção explícita e trata o tipo correspondente.
try
{
    throw new InvalidOperationException("Operação de demonstração.");
}
catch (InvalidOperationException error)
{
    Console.WriteLine(error.Message);
}
