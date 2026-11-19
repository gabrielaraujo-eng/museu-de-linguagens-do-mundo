#!/bin/bash
# A aritmética do Bash é inteira; a divisão trunca a parte fracionária.
a=7
b=3
printf 'Soma: %d\n' "$((a + b))"
printf 'Divisão inteira: %d\n' "$((a / b))"
