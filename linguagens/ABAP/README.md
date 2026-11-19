# ABAP

**Origem histórica:** a SAP registra a primeira referência documentada ao termo ABAP em 1976, no contexto do sistema RFM. A sintaxe e o ambiente de relatórios associados ao R/2 foram desenvolvidos no início dos anos 1980; portanto, não é usada aqui uma data isolada de “criação”.

## Descrição

ABAP (Advanced Business Application Programming) é a linguagem da plataforma SAP para programas e relatórios executados em um ambiente ABAP. Esta pasta contém dez exemplos e dez exercícios em arquivos `.abap`, organizados de forma progressiva para facilitar o aprendizado.

Os arquivos são **reports ABAP**, não scripts autônomos para Python, Node, shell ou navegador. Para verificar ou executar um arquivo, crie-o como programa executável em um sistema ABAP compatível (por exemplo, um sistema SAP on-premise ou SAP BTP, conforme os recursos disponíveis), faça o *syntax check*, ative e então execute.

## Exemplos inclusos

1. **exemplo_1.abap** — Olá Mundo
2. **exemplo_2.abap** — Variáveis e tipos
3. **exemplo_3.abap** — Controle de fluxo
4. **exemplo_4.abap** — Loops (repetições)
5. **exemplo_5.abap** — Subrotina `FORM`/`PERFORM`
6. **exemplo_6.abap** — Estruturas e tabelas internas
7. **exemplo_7.abap** — Tratamento de exceções
8. **exemplo_8.abap** — Manipulação de strings
9. **exemplo_9.abap** — Matemática
10. **exemplo_10.abap** — Ordenação de tabela interna

## Exercícios inclusos

1. **exercicio_1.abap** — Saída de texto
2. **exercicio_2.abap** — Cálculo com preço e quantidade
3. **exercicio_3.abap** — Condição de maioridade
4. **exercicio_4.abap** — Tabuada com `DO`
5. **exercicio_5.abap** — Subrotina para soma
6. **exercicio_6.abap** — Tabela de produtos
7. **exercicio_7.abap** — Conversão e exceção
8. **exercicio_8.abap** — Inversão de string
9. **exercicio_9.abap** — Área de círculo
10. **exercicio_10.abap** — Ordenação descendente

## Compatibilidade e precisão

Alguns arquivos usam recursos de ABAP moderno, como declarações inline `DATA(...)`, expressões construtoras `VALUE #( ... )`, templates de string `|...|`, `to_upper`, `reverse` e funções numéricas. Valide esses recursos no release-alvo; eles não devem ser prometidos para releases ABAP antigos. O *syntax check* do sistema ABAP é a validação definitiva.

`TYPE f` representa ponto flutuante e é usado nos exemplos matemáticos para demonstrações aproximadas. Não use esse tipo como recomendação para valores financeiros: o exercício 2 usa `TYPE p DECIMALS 2`, mais apropriado para a demonstração de preço decimal.

Os arquivos `exemplo_7.abap` e `exercicio_7.abap` também exigem execução para confirmar o caminho de exceção. O *syntax check* valida a forma do programa, mas não substitui o teste de runtime de divisão por zero ou de conversão inválida.

## Validação local disponível

Este repositório não inclui kernel ABAP, ADT nem compilador/runtime ABAP. Assim, a validação local deve ser estática e limitada a inspeções como extensão `.abap`, presença de `REPORT` e terminação das instruções; não se deve alegar compilação nesta pasta. Quando disponível, `abaplint` pode fornecer uma verificação auxiliar, mas não substitui o *syntax check*, a ativação ou a execução em um sistema ABAP compatível.

Para validação completa, abra cada fonte no ADT ou no ambiente de desenvolvimento ABAP, execute o *syntax check*, ative o report e execute-o. Nos exemplos de exceção, execute também o caminho que provoca a exceção esperada.
