begin
  comment exercicio 5: escreva um procedimento com resultado que calcule potencia inteira;
  integer procedure potencia (base, expoente);
    value base, expoente;
    integer base, expoente;
  begin
    integer resultado, k;
    resultado := 1;
    for k := 1 step 1 until expoente do resultado := resultado * base;
    potencia := resultado
  end;
  outstring (1, "2 elevado a 10 = ");
  outinteger (1, potencia (2, 10));
  newline (1);
  outstring (1, "3 elevado a 4 = ");
  outinteger (1, potencia (3, 4));
  newline (1)
end
