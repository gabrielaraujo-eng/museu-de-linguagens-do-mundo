begin
  comment exercicio 7: proteja uma divisao contra divisor nulo usando fault;
  comment fault interrompe o programa com mensagem do ambiente e nao existe captura;
  real a, b, r;
  a := 9.0;
  b := 3.0;
  if b = 0.0 then
  begin
    outstring (1, "divisor nulo, programa encerrado");
    newline (1);
    fault ("divisor nulo", b)
  end;
  r := a / b;
  outstring (1, "resultado: ");
  outreal (1, r);
  newline (1)
end
