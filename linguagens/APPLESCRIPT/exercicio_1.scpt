-- exercicio_1.applescript
-- Enunciado: exibir uma notificação de boas-vindas com título, subtítulo e
-- corpo montados a partir de variáveis.
-- Solução: display notification, das Standard Additions.

set nomeDoMuseu to "Museu de Linguagens do Mundo"
set linguagem to "AppleScript"
set anoDeCriacao to 1993

set corpo to "Bem-vindo ao estudo de " & linguagem & " (" & anoDeCriacao & ")."
set subtitulo to "Linguagem " & (count of characters of linguagem) & " caracteres no nome"

display notification corpo with title nomeDoMuseu subtitle subtitulo

-- O mesmo texto também vai para o log, útil quando não há interface gráfica.
log nomeDoMuseu & " — " & corpo
