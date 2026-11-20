-- exemplo_1.applescript
-- Tópico: estrutura mínima de um script e o comando display dialog.
-- Este arquivo é texto-fonte AppleScript. Para executar no macOS ele precisa
-- ser compilado com osacompile ou aberto no Script Editor.

-- Comentário de linha: começa com dois hífens.
(* Comentário de bloco: começa com parêntese seguido de asterisco e termina
   com asterisco seguido de parêntese. Pode ocupar várias linhas e é
   ignorado pelo compilador. *)

set nomeDoMuseu to "Museu de Linguagens do Mundo"
set saudacao to "Olá, mundo!"

-- display dialog pertence às Standard Additions, não ao núcleo da linguagem.
-- Ele devolve um record com as propriedades "button returned" e "text returned".
display dialog saudacao & return & "Bem-vindo ao " & nomeDoMuseu ¬
    buttons {"OK"} default button "OK" with title "Exemplo 1" giving up after 30

-- log escreve no console do Script Editor e no log unificado do sistema.
log "Exemplo 1 concluído: " & saudacao
