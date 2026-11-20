begin
  comment exemplo 5: procedimento com resultado e recursao;
  integer procedure fatorial (n);
    value n;
    integer n;
    if n <= 1 then fatorial := 1
    else fatorial := n * fatorial (n - 1);
  integer i;
  for i := 1 step 1 until 6 do
  begin
    outinteger (1, i);
    outstring (1, "! = ");
    outinteger (1, fatorial (i));
    newline (1)
  end
end
