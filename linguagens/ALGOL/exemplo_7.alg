begin
  comment exemplo 7: sinalizacao de erro com o procedimento de ambiente fault;
  comment fault e stop pertencem ao ambiente, nao ha try/catch em ALGOL 60;
  real dividendo, divisor, quociente;
  dividendo := 10.0;
  divisor := 2.0;
  if divisor = 0.0 then
  begin
    outstring (1, "erro: divisao por zero");
    newline (1);
    fault ("divisor nulo", divisor)
  end;
  quociente := dividendo / divisor;
  outstring (1, "quociente: ");
  outreal (1, quociente);
  newline (1)
end
