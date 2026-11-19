with Ada.Numerics.Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;

procedure Exercicio_9 is
   R : Float;
begin
   R := Ada.Numerics.Elementary_Functions.Sqrt (16.0);
   Put_Line (Float'Image (R));
end Exercicio_9;
