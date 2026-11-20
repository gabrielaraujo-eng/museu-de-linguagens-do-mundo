begin
  comment exercicio 3: classifique um numero inteiro como positivo, negativo ou zero;
  integer n;
  n := 0;
  outstring (1, "valor ");
  outinteger (1, n);
  outstring (1, ": ");
  if n > 0 then outstring (1, "positivo")
  else if n < 0 then outstring (1, "negativo")
  else outstring (1, "zero");
  newline (1)
end
