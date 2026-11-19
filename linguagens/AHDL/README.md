# AHDL

## O que é

AHDL (**Altera Hardware Description Language**) é uma linguagem de descrição de hardware (HDL) da Altera, integrada ao fluxo do Quartus. Ela descreve lógica combinacional, barramentos, tabelas-verdade, máquinas de estados e lógica parametrizada; não é uma linguagem de aplicação imperativa.

O ano de criação não está verificado nas fontes consultadas. O formato de fonte documentado é o **Text Design File (`.tdf`)**. O Quartus é o ambiente que edita, analisa, compila e simula esses arquivos; AHDL não é framework, biblioteca ou formato de dados.

## Exemplos e exercícios

Os arquivos `exemplo_1.tdf`–`exemplo_10.tdf` e `exercicio_1.tdf`–`exercicio_10.tdf` são designs didáticos contextualizados com `SUBDESIGN`, portas, seções `VARIABLE` quando necessárias e lógica AHDL. Eles cobrem:

1. entrada de projeto e saída de um sinal;
2. nós e barramentos;
3. `IF ... THEN ... ELSE ... END IF`;
4. `FOR (i) IN ... GENERATE`;
5. operações parametrizadas sobre barramentos;
6. nós/barramentos e observação sobre primitivas;
7. `ASSERT` como verificação de análise/simulação;
8. limitação conceitual de strings e operação sobre barramentos;
9. aritmética em barramentos;
10. `CASE`, `WHEN OTHERS` e máquina de estados;

Os exercícios também apresentam `TABLE`, `DEFAULTS`, `CONSTANT`, `AND`, `OR` e `XOR` em contexto de subdesign. `ASSERT` não é tratamento de exceções recuperável, e AHDL não oferece strings gerais como uma linguagem de aplicação.

Arquivos `.ahdl` com o mesmo nome são cópias legadas para comparação didática. A extensão `.ahdl` não foi confirmada como oficial; use os `.tdf` no fluxo do Quartus. Comentários que mencionam `DFF`/`COUNTER` deixam explícito que primitivas dependem da biblioteca e da versão do Quartus, em vez de alegar compilabilidade universal.

## Validação

Não há compilador AHDL independente moderno identificado neste ambiente. `quartus_sh`, `quartus_map`, `ghdl` e `iverilog` não estão instalados; GHDL e Icarus, além disso, não validariam AHDL. As verificações locais deste diretório são estáticas (estrutura, extensão e ausência de padrões VHDL/pseudocódigo).

Para validação real, abra um `.tdf` em uma instalação compatível do Quartus II/Quartus Prime, adicione-o a um projeto `.qpf`/`.qsf` como top-level design e execute a análise/compilação, por exemplo `quartus_sh --flow compile <projeto>` quando o executável estiver disponível. A compatibilidade de primitivas e a semântica final devem ser confirmadas pela versão do Quartus usada.

## Referências de sintaxe

- [AHDL Introduction](http://xilinx.pe.kr/_altera/html/_sw/q2help/source/ahdl/ahdl_intro.htm)
- [Subdesign Section Syntax](http://xilinx.pe.kr/_altera/html/_sw/q2help/source/ahdl/ahdl_syntax_subdesign_section.htm)
- [Variable Section Syntax](http://xilinx.pe.kr/_altera/html/_sw/q2help/source/ahdl/ahdl_syntax_variable_section.htm)
- [If Then, For Generate, Case, Assert, Truth Table e Defaults](http://xilinx.pe.kr/_altera/html/_sw/q2help/source/ahdl/)
- [Intel Support: Text Design File syntax error](https://www.intel.com/content/www/us/en/support/programmable/articles/000080243.html)
