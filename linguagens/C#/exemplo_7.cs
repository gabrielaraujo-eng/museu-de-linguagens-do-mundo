using System;

// O texto inválido produz uma FormatException que é tratada abaixo.
try
{
    _ = int.Parse("não é um inteiro");
}
catch (FormatException error)
{
    Console.WriteLine($"Entrada inválida: {error.Message}");
}
