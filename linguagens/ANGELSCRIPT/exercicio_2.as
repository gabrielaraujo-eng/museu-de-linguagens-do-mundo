// exercicio_2.as - conversao de Celsius para Fahrenheit com double
//
// Tarefa: converter uma lista de temperaturas usando a formula
// F = C * 9 / 5 + 32 e imprimir o resultado com duas casas decimais.

double paraFahrenheit(double celsius)
{
    return celsius * 9.0 / 5.0 + 32.0;
}

void main()
{
    // Cem graus negativos a cem graus, de 25 em 25.
    for (int c = -100; c <= 100; c += 25)
    {
        double f = paraFahrenheit(double(c));
        print(formatInt(c, "", 4) + " C = " + formatFloat(f, "", 0, 2) + " F");
    }

    // Pontos de referencia conhecidos.
    print("agua congela: " + paraFahrenheit(0.0) + " F");
    print("agua ferve:   " + paraFahrenheit(100.0) + " F");

    // Conversao inversa, so para conferir a ida e a volta.
    double fahrenheit = 98.6;
    double celsius = (fahrenheit - 32.0) * 5.0 / 9.0;
    print("98.6 F = " + formatFloat(celsius, "", 0, 4) + " C");

    // Diferenca entre os tipos: float tem 32 bits e perde precisao.
    float aproximado = float(paraFahrenheit(36.6));
    print("float: " + aproximado + " / double: " + paraFahrenheit(36.6));
}
