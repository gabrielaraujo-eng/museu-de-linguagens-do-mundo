with Ada.Integer_Text_IO;

procedure Exercicio_6 is
   type List is array (1 .. 3) of Integer;
   My_List : List := (1, 2, 3);
begin
   for I in My_List'Range loop
      Ada.Integer_Text_IO.Put (My_List (I));
   end loop;
end Exercicio_6;
