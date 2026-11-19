with Ada.Text_IO; use Ada.Text_IO;

procedure Exercicio_7 is
begin
   begin
      null;
   exception
      when others =>
         Put_Line ("Erro");
   end;
end Exercicio_7;
