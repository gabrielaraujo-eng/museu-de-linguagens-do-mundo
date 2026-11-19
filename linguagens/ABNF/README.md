# ABNF

**Raízes:** RFC 733 (1977); **especificação consolidada:** RFC 5234 (2008)

## Descrição

ABNF (Augmented Backus-Naur Form) é uma metalinguagem/notação formal para descrever a sintaxe de protocolos e formatos de dados. Não é uma linguagem de programação executável: cada arquivo deste diretório contém uma *rulelist*, isto é, um conjunto de regras que pode ser consumido por um parser ABNF.

A sintaxe básica usa `name = elements`. Regras podem combinar terminais, concatenação, alternativas (`/`), grupos, opcionais (`[ ... ]`) e repetição (`*element`, `nelement`). Valores numéricos usam `%b`, `%d` ou `%x`. A RFC 5234 define literais entre aspas como ASCII e sem distinção de maiúsculas/minúsculas; a RFC 7405 acrescenta `%s"..."` para literais sensíveis a maiúsculas/minúsculas e `%i"..."` para explicitar o comportamento insensível.

## Exemplos inclusos

1. **exemplo_1.abnf** — uma regra básica e intervalos numéricos (`%x`).
2. **exemplo_2.abnf** — uma regra nomeada com repetição e dígitos.
3. **exemplo_3.abnf** — alternativa entre terminais.
4. **exemplo_4.abnf** — repetição limitada e grupo.
5. **exemplo_5.abnf** — composição por referências a regras nomeadas.
6. **exemplo_6.abnf** — concatenação, grupo, opcionalidade implícita e repetição.
7. **exemplo_7.abnf** — terminal NUL; ABNF não define tratamento de erros.
8. **exemplo_8.abnf** — caracteres alfabéticos e repetição.
9. **exemplo_9.abnf** — dígitos e intervalo numérico.
10. **exemplo_10.abnf** — alternativa, referência e elemento opcional.

## Exercícios inclusos

Os exercícios praticam composição de regras, terminais, repetição, recursão, opcionais e intervalos. Os exercícios 1, 6, 7 e 10 são modelos simplificados: não substituem as gramáticas completas de RFC 5322, HTTP, calendários ou URI. Em particular, uma regra que reconhece a forma `YYYY-MM-DD` não verifica se a data existe.

## Como validar

Leia os arquivos como rulelists, não como programas. A validação correta é resolver as referências e analisar a gramática com um parser ABNF; opcionalmente, depois, aplicar entradas a uma regra inicial. Não existe um comando universal para “executar ABNF”.

Neste ambiente, `abnf_check`, `abnf` e o módulo Python `abnf` podem não estar instalados. Quando o pacote Python estiver disponível, uma validação pode ser feita com a API documentada por ele:

```sh
python3 - <<'PY' linguagens/ABNF/exemplo_2.abnf
import sys
from abnf import Rule

class FromFileRule(Rule):
    pass

FromFileRule.from_file(sys.argv[1])
print("grammar OK:", sys.argv[1])
PY
```

Se não houver parser instalado, faça apenas validações estáticas: cada regra deve ter a forma `nome = elementos`, referências usadas devem ser declaradas na própria rulelist (ou fornecidas explicitamente pelo parser como o conjunto core), e os arquivos devem permanecer em ASCII quando seus terminais forem literais `char-val` da ABNF base. Os arquivos deste diretório declaram localmente as regras auxiliares necessárias, salvo recursos especiais que uma ferramenta possa injetar por opção.

## Referências

- [RFC 5234 — Augmented BNF for Syntax Specifications: ABNF](https://www.rfc-editor.org/rfc/rfc5234)
- [RFC 7405 — Case-Sensitive String Support in ABNF](https://www.rfc-editor.org/rfc/rfc7405)
- [RFC 733 — Standard for the Format of ARPA Network Text Messages](https://www.rfc-editor.org/rfc/rfc733)
- [RFC 822 — Standard for ARPA Internet Text Messages](https://www.rfc-editor.org/rfc/rfc822)
- [Pacote Python `abnf`](https://pypi.org/project/abnf/)
