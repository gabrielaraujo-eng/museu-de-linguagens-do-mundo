# Arduino (C++)
**Linhagem:** Wiring / Processing, de onde a API do Arduino deriva; a linguagem em si é C++ compilado por `avr-gcc`
**Plataforma desta pasta:** Arduino UNO (ATmega328P, AVR), placa de referência `arduino:avr:uno`
## Descrição
Um sketch Arduino não é uma linguagem separada: é C++ com uma biblioteca de placa e duas funções que o núcleo chama. `setup()` roda uma vez, depois do reset, e serve para inicializar pinos e periféricos; `loop()` é chamada repetidamente logo após `setup()` retornar, e o programa nunca "termina" — não há `main()` escrito por quem programa. Os arquivos desta pasta usam a extensão `.ino`, que o Arduino IDE e o `arduino-cli` transformam em uma unidade de compilação C++ acrescentando os protótipos das funções e a chamada de `init()`.

Os exemplos usam apenas a API documentada na Language Reference oficial: `pinMode`, `digitalWrite`, `digitalRead`, `analogRead`, `analogWrite`, `delay`, `millis`, `map`, `Serial.begin`/`Serial.println`, `#define` e os tipos `int`, `long`, `unsigned long`, `float`, `bool` e `String`. Não há exceções em C++ no AVR por padrão, então "tratamento de erros" aqui significa código de retorno, validação de faixa e tempo limite com `millis()`.
## Arquivos
Cada tópico aparece como um sketch independente. Todos compilam para o UNO e foram verificados com `arduino-cli compile`.
### Exemplos
1. `exemplo_1` — estrutura mínima: `setup`, `loop` e saída serial ("Olá, Mundo")
2. `exemplo_2` — variáveis e tipos (`int`, `long`, `unsigned long`, `float`, `bool`, `char`, `String`) e `sizeof`
3. `exemplo_3` — controle de fluxo: `if`/`else if`/`else` e `switch`/`case` sobre uma leitura analógica
4. `exemplo_4` — laços `for`, `while` e `do...while` acendendo uma sequência de LEDs
5. `exemplo_5` — funções com parâmetros, retorno, valor padrão e recursão
6. `exemplo_6` — estruturas de dados: vetor, matriz e `struct` com `typedef`
7. `exemplo_7` — tratamento de erros sem exceções: códigos de retorno, faixa válida e tempo limite
8. `exemplo_8` — `String`: concatenação, `length`, `substring`, `indexOf`, `replace`, `toCharArray`
9. `exemplo_9` — matemática: `map`, `constrain`, `abs`, `min`, `max`, `sqrt`, `pow`, `sin`, `random`
10. `exemplo_10` — algoritmos: ordenação por trocas (bubble sort) e busca binária
### Exercícios
Cada exercício é um sketch completo, resolvido e distinto, sobre o tópico correspondente:
1. `exercicio_1` — dois LEDs alternados, com mensagem inicial na serial
2. `exercicio_2` — tabela de conversão de Celsius para Fahrenheit com `float`
3. `exercicio_3` — classificação de uma leitura de `A0` em faixas com `if`/`else` e `switch`
4. `exercicio_4` — contagem regressiva com `for`, `while` e `do...while`
5. `exercicio_5` — funções: fatorial recursivo e média de três notas
6. `exercicio_6` — vetor de cinco leituras: inversão, maior, menor e média
7. `exercicio_7` — divisão protegida contra divisor zero e leitura com tempo limite
8. `exercicio_8` — `String`: contar vogais, inverter e comparar textos
9. `exercicio_9` — hipotenusa, área do círculo e conversão de ADC para tensão
10. `exercicio_10` — ordenar seis notas, calcular mediana e buscar um valor
## Como compilar
O sketch precisa estar em uma pasta com o mesmo nome do arquivo `.ino`. Para compilar sem placa conectada:
```sh
arduino-cli core install arduino:avr
arduino-cli compile --fqbn arduino:avr:uno exemplo_1
```
Para gravar na placa:
```sh
arduino-cli upload -p /dev/ttyACM0 --fqbn arduino:avr:uno exemplo_1
arduino-cli monitor -p /dev/ttyACM0 -c baudrate=9600
```
No Arduino IDE, basta abrir o `.ino`, escolher *Arduino Uno* em Ferramentas > Placa e usar Verificar/Enviar.
## Escopo e limitações documentadas
- **Sem `main()`:** o núcleo fornece `main()` e chama `setup()` e `loop()`. Um sketch que não defina as duas funções não compila.
- **Sem exceções nem `try`/`catch`:** o AVR é compilado sem suporte a exceções C++. Erros são sinalizados por valor de retorno, `bool` de sucesso ou mensagem na serial.
- **`analogWrite` é PWM, não tensão analógica:** no UNO funciona nos pinos 3, 5, 6, 9, 10 e 11, com valores de 0 a 255. Nos demais pinos digitais a chamada não gera PWM.
- **`analogRead` devolve 0 a 1023:** o conversor do UNO tem 10 bits e referência padrão de 5 V, o que dá cerca de 4,9 mV por passo.
- **`String` custa memória:** o UNO tem 2 KB de SRAM. Os sketches usam `String` apenas em textos curtos; em projetos reais prefira `char[]` e a macro `F()`.
- **`millis()` estoura:** o contador é `unsigned long` e volta a zero após cerca de 49 dias. As comparações desta pasta usam subtração (`millis() - anterior`), que continua correta na virada.
- **Sem hardware, sem saída física:** a validação aqui é de compilação. Os efeitos em LEDs, botões e potenciômetro exigem a placa real.
## Validação executada
Os 20 sketches foram compilados com `arduino-cli 1.6.0` e núcleo `arduino:avr 1.8.8`, alvo `arduino:avr:uno`, com `--warnings all`: 20 de 20 compilaram com código 0 e nenhum aviso originado nos sketches (os únicos avisos vêm do próprio núcleo, em `cores/arduino/new.cpp`). O comando e a saída de cada um estão no `RELATORIO.md` desta pasta.
## Referências
- Language Reference: <https://docs.arduino.cc/language-reference/>
- `setup()`: <https://docs.arduino.cc/language-reference/en/structure/sketch/setup/>
- `loop()`: <https://docs.arduino.cc/language-reference/en/structure/sketch/loop/>
- `analogWrite()`: <https://docs.arduino.cc/language-reference/en/functions/analog-io/analogWrite/>
- `map()`: <https://docs.arduino.cc/language-reference/en/functions/math/map/>
- `Serial`: <https://docs.arduino.cc/language-reference/en/functions/communication/serial/>
- Arduino CLI: <https://arduino.github.io/arduino-cli/>
