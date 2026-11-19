using System;
using System.IO;

// Lê t.txt se estiver presente no diretório de trabalho.
const string path = "t.txt";
if (File.Exists(path))
{
    using var reader = new StreamReader(path);
    Console.WriteLine(reader.ReadToEnd());
}
else
{
    Console.Error.WriteLine("Arquivo t.txt não encontrado.");
}
