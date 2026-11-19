with Ada.Integer_Text_IO;

procedure Exemplo_6 is
   type Int_Array is array (1 .. 10) of Integer;
   My_Array : Int_Array := (others => 0);
begin
   My_Array (1) := 42;
   Ada.Integer_Text_IO.Put (My_Array (1));
end Exemplo_6;
