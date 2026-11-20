begin
  comment exemplo 4: laco for com step e until;
  integer i;
  outstring (1, "pares de 2 a 10: ");
  for i := 2 step 2 until 10 do
  begin
    outinteger (1, i);
    space (1)
  end;
  newline (1);
  outstring (1, "contagem regressiva: ");
  for i := 3 step -1 until 1 do
  begin
    outinteger (1, i);
    space (1)
  end;
  newline (1)
end
