begin
  comment exemplo 8: string como parametro formal de procedimento;
  comment em ALGOL 60 string nao e tipo de variavel, apenas especificador de parametro;
  procedure escreve (texto);
    string texto;
    outstring (1, texto);
  procedure moldura (texto, largura);
    string texto;
    integer largura;
  begin
    integer i;
    outstring (1, "+");
    for i := 1 step 1 until largura do outstring (1, "-");
    outstring (1, "+");
    newline (1);
    outstring (1, "|");
    escreve (texto);
    outstring (1, "|");
    newline (1);
    outstring (1, "+");
    for i := 1 step 1 until largura do outstring (1, "-");
    outstring (1, "+");
    newline (1)
  end;
  moldura ("ALGOL 60", 8);
  escreve ("fim do exemplo");
  newline (1)
end
