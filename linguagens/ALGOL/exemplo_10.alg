begin
  comment exemplo 10: algoritmo de ordenacao por trocas sobre vetor;
  comment own conserva o valor entre reentradas no bloco, nao e um static de C;
  integer procedure trocas;
  begin
    own integer total;
    total := total + 1;
    trocas := total
  end;
  procedure ordena (a, n);
    value n;
    integer array a;
    integer n;
  begin
    integer i, j, aux;
    for i := 1 step 1 until n - 1 do
      for j := 1 step 1 until n - i do
        if a [j] > a [j + 1] then
        begin
          aux := a [j];
          a [j] := a [j + 1];
          a [j + 1] := aux;
          aux := trocas
        end
  end;
  integer array v [1:5];
  integer i, k;
  v [1] := 5; v [2] := 3; v [3] := 9; v [4] := 1; v [5] := 7;
  ordena (v, 5);
  for i := 1 step 1 until 5 do
  begin
    outinteger (1, v [i]);
    space (1)
  end;
  newline (1);
  outstring (1, "trocas: ");
  outinteger (1, trocas);
  newline (1)
end
