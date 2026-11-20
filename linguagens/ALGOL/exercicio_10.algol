begin
  comment exercicio 10: calcule maior, menor e media de um vetor de seis notas;
  integer array nota [1:6];
  integer i, maior, menor, soma;
  real media;
  nota [1] := 7; nota [2] := 9; nota [3] := 5;
  nota [4] := 10; nota [5] := 6; nota [6] := 8;
  maior := nota [1];
  menor := nota [1];
  soma := 0;
  for i := 1 step 1 until 6 do
  begin
    soma := soma + nota [i];
    if nota [i] > maior then maior := nota [i];
    if nota [i] < menor then menor := nota [i]
  end;
  media := soma / 6.0;
  outstring (1, "maior: "); outinteger (1, maior); newline (1);
  outstring (1, "menor: "); outinteger (1, menor); newline (1);
  outstring (1, "media: "); outreal (1, media); newline (1)
end
