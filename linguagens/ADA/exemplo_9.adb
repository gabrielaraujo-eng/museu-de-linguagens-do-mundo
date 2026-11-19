with Ada.Text_IO; use Ada.Text_IO;

procedure Exemplo_9 is
   X : Integer := 10;
   Y : Integer := 20;
   Z : Integer;
begin
   Z := X + Y;
   Put_Line (Integer'Image (Z));
end Exemplo_9;
