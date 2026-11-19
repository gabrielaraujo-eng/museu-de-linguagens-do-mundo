with Ada.Text_IO; use Ada.Text_IO;

procedure Exemplo_10 is
   task type Worker is
      entry Start;
   end Worker;

   W : Worker;

   task body Worker is
   begin
      accept Start;
   end Worker;
begin
   Put_Line ("Aguardando a tarefa");
   W.Start;
   Put_Line ("Tarefa concluída");
end Exemplo_10;
