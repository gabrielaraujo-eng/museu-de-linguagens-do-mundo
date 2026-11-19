using System;

// Instancia a classe e usa sua propriedade autoimplementada.
var item = new ExampleItem { Id = 10 };
Console.WriteLine($"Id: {item.Id}");

public sealed class ExampleItem
{
    public int Id { get; set; }
}
