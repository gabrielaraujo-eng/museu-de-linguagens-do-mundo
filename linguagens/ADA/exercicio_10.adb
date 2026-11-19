with Ada.Text_IO; use Ada.Text_IO;

procedure Exercicio_10 is
   task type T is
   end T;

   Worker : T;

   task body T is
   begin
      null;
   end T;
begin
   Put_Line ("Tarefa criada");
end Exercicio_10;
