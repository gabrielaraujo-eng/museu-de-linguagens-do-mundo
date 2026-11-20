begin
  comment exemplo 6: vetores com limites entre colchetes;
  integer array v [1:5];
  integer i, soma, maior;
  for i := 1 step 1 until 5 do v [i] := 2 * i;
  soma := 0;
  maior := v [1];
  for i := 1 step 1 until 5 do
  begin
    soma := soma + v [i];
    if v [i] > maior then maior := v [i]
  end;
  outstring (1, "soma: ");
  outinteger (1, soma);
  newline (1);
  outstring (1, "maior: ");
  outinteger (1, maior);
  newline (1)
end
