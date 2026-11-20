begin
  comment exercicio 6: inverta a ordem dos elementos de um vetor de cinco posicoes;
  integer array v [1:5];
  integer i, aux;
  for i := 1 step 1 until 5 do v [i] := i;
  for i := 1 step 1 until 2 do
  begin
    aux := v [i];
    v [i] := v [6 - i];
    v [6 - i] := aux
  end;
  for i := 1 step 1 until 5 do
  begin
    outinteger (1, v [i]);
    space (1)
  end;
  newline (1)
end
