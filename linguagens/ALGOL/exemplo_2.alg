begin
  comment exemplo 2: declaracao e atribuicao dos tipos basicos;
  integer idade;
  real altura;
  boolean adulto;
  idade := 17;
  altura := 1.75;
  adulto := idade >= 18;
  outstring (1, "idade: ");
  outinteger (1, idade);
  newline (1);
  outstring (1, "altura: ");
  outreal (1, altura);
  newline (1);
  outstring (1, "adulto: ");
  if adulto then outstring (1, "sim") else outstring (1, "nao");
  newline (1)
end
