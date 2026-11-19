with Ada.Integer_Text_IO;
with Ada.Text_IO;

procedure Exemplo_4 is
begin
   for I in 1 .. 10 loop
      Ada.Integer_Text_IO.Put (I);
      Ada.Text_IO.New_Line;
   end loop;
end Exemplo_4;
