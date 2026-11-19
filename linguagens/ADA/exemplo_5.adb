with Ada.Text_IO; use Ada.Text_IO;

procedure Exemplo_5 is
   function Square (X : Integer) return Integer is
   begin
      return X * X;
   end Square;
begin
   Put_Line (Integer'Image (Square (5)));
end Exemplo_5;
