with Ada.Text_IO; use Ada.Text_IO;

procedure Exemplo_7 is
   X : Integer := 0;
begin
   begin
      X := 1 / X;
   exception
      when Constraint_Error =>
         Put_Line ("Erro de restrição");
   end;
end Exemplo_7;
