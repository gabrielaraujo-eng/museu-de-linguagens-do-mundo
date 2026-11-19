using System;
using System.Threading.Tasks;

// Task.Delay é aguardada para demonstrar async/await.
async Task RunAsync()
{
    await Task.Delay(1);
    Console.WriteLine("Tarefa assíncrona concluída.");
}

await RunAsync();
