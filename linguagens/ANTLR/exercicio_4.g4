// exercicio_4.g4 -- EXERCICIO RESOLVIDO
//
// Tarefa: reconhecer data e hora no estilo ISO 8601, com fuso opcional:
//   AAAA-MM-DD, AAAA-MM-DDThh:mm, AAAA-MM-DDThh:mm:ss.fff e sufixo Z ou +hh:mm.
// Entradas aceitas, por exemplo:
//   2026-11-20
//   2026-11-20T19:41:19.250-03:00
// Observacao: a gramatica verifica a forma; validar faixas (mes 1..12,
// minuto 0..59) exige um listener que consulte o contexto de dataHora.
//
grammar exercicio_4;

dataHora : data ('T' hora fuso?)? EOF ;

data  : ano=NUMERO '-' mes=NUMERO '-' dia=NUMERO ;
hora  : hh=NUMERO ':' mm=NUMERO (':' ss=NUMERO fracao?)? ;
fracao : ('.' | ',') NUMERO ;
fuso  : 'Z' | ('+' | '-') NUMERO ':' NUMERO ;

NUMERO : [0-9]+ ;
WS     : [ \t\r\n]+ -> skip ;
