# C++

**Início do desenvolvimento:** 1979. **Primeiro lançamento comercial:** 1985.

## Descrição

C++ é uma linguagem de programação de propósito geral padronizada pelo ISO/IEC WG21. Esta pasta reúne exemplos e exercícios independentes em C++20; compile e execute um arquivo por vez.

## Exemplos

1. `exemplo_1.cpp` — saída básica
2. `exemplo_2.cpp` — variáveis e `std::string`
3. `exemplo_3.cpp` — decisão com `if`
4. `exemplo_4.cpp` — repetição com `for`
5. `exemplo_5.cpp` — lambda
6. `exemplo_6.cpp` — `std::vector`
7. `exemplo_7.cpp` — tratamento de exceção
8. `exemplo_8.cpp` — composição de strings
9. `exemplo_9.cpp` — cálculo com `std::sqrt`
10. `exemplo_10.cpp` — classe template `Box`

## Exercícios demonstrativos

1. `exercicio_1.cpp` — mensagem
2. `exercicio_2.cpp` — leitura validada de inteiro
3. `exercicio_3.cpp` — decisão com retorno antecipado
4. `exercicio_4.cpp` — range-for sobre vector
5. `exercicio_5.cpp` — definição e chamada de função
6. `exercicio_6.cpp` — `std::unique_ptr` e `std::make_unique`
7. `exercicio_7.cpp` — encerramento por `std::terminate`
8. `exercicio_8.cpp` — comprimento de string
9. `exercicio_9.cpp` — valor absoluto inteiro
10. `exercicio_10.cpp` — leitura de arquivo

Todos os vinte arquivos têm comentários breves em português e definem um programa independente. Eles devem ser compilados separadamente, não ligados todos juntos.

## Compilação e execução

É necessário um compilador C++ com suporte a C++20. Na raiz do repositório, compile e execute um arquivo por vez. Por exemplo:

```sh
g++ -std=c++20 -Wall -Wextra -pedantic linguagens/C++/exemplo_1.cpp -o /tmp/exemplo_1
/tmp/exemplo_1
```

Repita o comando usando o caminho do fonte desejado e um nome de saída diferente. `exercicio_2.cpp` lê um inteiro da entrada padrão. `exercicio_7.cpp` chama `std::terminate` intencionalmente e, portanto, encerra o processo de forma anormal. `exercicio_10.cpp` lê `t.txt` no diretório de trabalho; forneça esse arquivo antes de executá-lo. Não há dependências externas além de uma toolchain C++ e sua biblioteca padrão.
