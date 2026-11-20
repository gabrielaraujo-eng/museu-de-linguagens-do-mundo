# ASSEMBLY_X86

**Ano de criação:** 1978 (Intel 8086, 16 bits); 1985 (80386, 32 bits); 2003 (AMD64, 64 bits)
**Dialeto adotado nesta pasta:** NASM, sintaxe Intel, x86-64, Linux, somente chamadas de sistema

## Descrição

Assembly não é uma linguagem única: é o conjunto de mnemônicos que corresponde diretamente às instruções de uma família de processadores. O mesmo conceito ("somar dois números") se escreve de formas incompatíveis em NASM, MASM, GAS/AT&T ou TASM, e o mesmo programa depende do sistema operacional para entrada e saída. Por isso esta pasta fixa um dialeto único, declarado no cabeçalho de cada arquivo:

- **Montador:** NASM 2.x (`nasm`), formato de saída `elf64`.
- **Arquitetura:** x86-64 (AMD64), registradores de 64 bits (`rax`, `rdi`, `rsi`, `rdx`), endereçamento `[base + índice*escala + deslocamento]`.
- **Sistema operacional:** Linux, com chamadas de sistema diretas (`syscall`), sem `libc`.
- **Ponto de entrada:** `global _start`, encerrando com `sys_exit` (syscall 60).

A data de 1981 usada no cadastro do museu corresponde ao IBM PC (5150), que popularizou o 8088; a arquitetura x86 em si nasceu em 1978 com o 8086. Os programas desta pasta usam a variante de 64 bits, definida pela AMD em 2003 e adotada pelo Linux como `x86_64`.

## Estrutura dos arquivos

Cada arquivo é um programa completo e independente: seções `section .data` (dados inicializados), `section .bss` (dados não inicializados) e `section .text` (código), com comentários em português explicando cada instrução relevante. Os programas não dependem de bibliotecas externas, apenas do kernel do Linux; por isso são ligados com `ld`, sem `gcc`.

### Exemplos

1. `exemplo_1` — estrutura mínima: `sys_write` e `sys_exit`
2. `exemplo_2` — variáveis e tamanhos de dados (`db`, `dw`, `dd`, `dq`) e `movzx`
3. `exemplo_3` — controle de fluxo com `cmp`, `test` e saltos condicionais (`jl`, `jg`, `je`, `ja`)
4. `exemplo_4` — laços com `loop`, `dec`/`jnz` e condição no topo
5. `exemplo_5` — funções com `call`/`ret`, quadro de pilha com `rbp` e recursão (fatorial)
6. `exemplo_6` — vetores indexados e registros com `struc`/`istruc` (`aluno_size`, `aluno.nota`)
7. `exemplo_7` — tratamento de erros: código de status próprio e `errno` negativo em `rax`
8. `exemplo_8` — strings terminadas em zero: `strlen` manual, `rep movsb` e inversão no lugar
9. `exemplo_9` — matemática inteira: `mul`, `div`, `idiv`, `cqo`, mdc por Euclides, mmc e potência
10. `exemplo_10` — algoritmos: ordenação por trocas (bubble sort) e busca binária

### Exercícios

Cada exercício é um programa completo, resolvido e distinto, sobre o tópico correspondente:

1. `exercicio_1` — três linhas na saída padrão com três `sys_write`
2. `exercicio_2` — conversão de Celsius para Fahrenheit com `imul` e `idiv`
3. `exercicio_3` — classificação de inteiros em negativo, zero ou positivo com salto indireto por tabela
4. `exercicio_4` — soma dos pares de 1 a 20 com `test` de paridade
5. `exercicio_5` — função de potência inteira com `call`/`ret` e `loop`
6. `exercicio_6` — inversão de um vetor de cinco posições no próprio lugar
7. `exercicio_7` — divisão protegida contra divisor nulo, com código de status
8. `exercicio_8` — conversão de string para maiúsculas por aritmética ASCII
9. `exercicio_9` — hipotenusa inteira por soma de quadrados e raiz inteira
10. `exercicio_10` — maior, menor, soma, média e resto de seis notas

## Como montar e executar

```sh
# montar (gera o objeto ELF64)
nasm -f elf64 -o exemplo_1.o exemplo_1.asm

# ligar (gera o executável estático; ld basta, pois não há libc)
ld -o exemplo_1 exemplo_1.o

# executar
./exemplo_1
echo $?          # código de saída do processo
```

Um laço para montar, ligar e executar todos os arquivos:

```sh
for f in exemplo_*.asm exercicio_*.asm; do
  base="${f%.asm}"
  nasm -f elf64 -o "$base.o" "$f" && ld -o "$base" "$base.o" && "./$base"
done
```

## Escopo e limitações documentadas

- **Somente Linux x86-64.** Os programas usam a convenção de chamada de sistema do Linux (`rax` = número, `rdi`/`rsi`/`rdx` = argumentos, `syscall`). Não há equivalente para Windows (`int 0x80`/`syscall` do NT) nem para macOS. Os mesmos arquivos não montam em MASM/TASM (sintaxe e diretivas diferentes) nem em GAS sem reescrita para a sintaxe AT&T.
- **Sem `libc`.** Toda saída é feita com `sys_write`; a conversão de inteiros para texto e o `strlen` são rotinas escritas à mão, repetidas em cada arquivo para mantê-los autocontidos.
- **`syscall` destrói `rcx` e `r11`.** Vários arquivos guardam contadores em `r12`/`r13` justamente por isso; é uma armadilha clássica de quem vem de linguagens de alto nível.
- **Rótulos locais são relativos ao último rótulo global.** Em NASM, `.laco` pertence ao rótulo global anterior; ao inserir um novo rótulo global no meio de uma rotina, os rótulos locais seguintes mudam de escopo. Onde isso poderia confundir, foram usados nomes globais.
- **Números inteiros apenas.** Não há ponto flutuante nos exemplos: `exemplo_9` e `exercicio_2` usam divisão inteira, e por isso os resultados são truncados (por exemplo, 37 °C = 98 °F pela fórmula inteira, não 98,6 °F).
- **Sem depurador no fluxo de validação.** A verificação foi feita montando, ligando e executando cada programa, conferindo a saída e o código de retorno.
- **Binários estáticos e sem símbolos removidos.** O `ld` não emite aviso nesta configuração (NASM 2.16.01 e GNU ld 2.42); o executável resultante é `ELF 64-bit LSB executable, x86-64, statically linked`.
- **Versão do manual.** A documentação on-line do NASM já está na série 3.x; a sintaxe usada aqui é a comum às versões 2.x e 3.x (`section`, `global`, `struc`, `equ`), testada com o NASM 2.16.01 das distribuições.

## Validação executada

Os 20 programas foram montados com `nasm -f elf64`, ligados com `ld` e executados: 20 de 20 terminaram com código 0 e produziram a saída esperada para o tópico. A tabela de comandos e saídas está em `RELATORIO.md`, nesta mesma pasta.

## Referências

- Manual do NASM: <https://www.nasm.us/doc/>
- Intel 64 and IA-32 Architectures Software Developer's Manual: <https://www.intel.com/content/www/us/en/developer/articles/technical/intel-sdm.html>
- System V Application Binary Interface, AMD64 Architecture Processor Supplement: <https://refspecs.linuxbase.org/elf/x86_64-abi-0.99.pdf>
- Tabela de chamadas de sistema x86-64 do Linux: <https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/x86/entry/syscalls/syscall_64.tbl>
- Jonathan Bartlett, *Programming from the Ground Up* (introdução a assembly com GNU/Linux): <https://download.savannah.gnu.org/releases/pgubook/ProgrammingGroundUp-1-0-booksize.pdf>
