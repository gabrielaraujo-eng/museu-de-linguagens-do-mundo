with Ada.Text_IO; use Ada.Text_IO;

procedure Exercicio_5 is
   function Add (A, B : Integer) return Integer is
   begin
      return A + B;
   end Add;
begin
   Put_Line (Integer'Image (Add (2, 3)));
end Exercicio_5;
