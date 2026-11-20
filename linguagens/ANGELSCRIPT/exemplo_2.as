// exemplo_2.as - tipos primitivos, literais e conversoes
//
// AngelScript tem tipagem estatica. Os tipos primitivos sao:
//   int8, int16, int, int64      (com sinal)
//   uint8, uint16, uint, uint64  (sem sinal)
//   float (32 bits), double (64 bits), bool
// O tipo string nao e primitivo: vem do add-on scriptstdstring.

void main()
{
    int    inteiro   = 42;
    int    negativo  = -7;
    uint   natural   = 3000000000;      // cabe em uint (32 bits sem sinal)
    int64  grande    = 9000000000;      // precisa de 64 bits
    float  simples   = 2.5f;            // sufixo f: literal float
    double precisao  = 3.14159265358979; // sem sufixo: literal double
    bool   ativo     = true;

    // Variavel const: precisa ser inicializada e nao pode ser alterada.
    const int LIMITE = 10;

    print("int: " + inteiro);
    print("int negativo: " + negativo);
    print("uint: " + natural);
    print("int64: " + grande);
    print("float: " + simples);
    print("double: " + precisao);
    print("bool: " + ativo);
    print("const int: " + LIMITE);

    // Conversoes explicitas usam a forma Tipo(expressao).
    // double -> int trunca a parte fracionaria.
    int truncado = int(3.99);
    // int -> double preserva o valor.
    double promovido = double(inteiro);
    // double -> float perde precisao.
    float reduzido = float(precisao);

    print("int(3.99) = " + truncado);
    print("double(42) = " + promovido);
    print("float(pi) = " + reduzido);

    // Aritmetica entre int e double promove o int para double.
    double metade = 7 / 2.0;    // 3.5
    int divisaoInteira = 7 / 2; // 3
    print("7 / 2.0 = " + metade);
    print("7 / 2   = " + divisaoInteira);

    // O resto (%) so existe para tipos inteiros.
    print("7 % 2 = " + (7 % 2));

    // O operador de atribuicao composta vale para todos os numericos.
    inteiro += 8;
    inteiro *= 2;
    print("42 + 8 * 2 = " + inteiro);
}
