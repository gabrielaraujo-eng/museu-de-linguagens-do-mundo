#!/bin/bash
# Compara um inteiro usando a construção aritmética do Bash.
x=42
if (( x > 10 )); then
    printf '%s\n' 'Maior que 10'
elif (( x == 10 )); then
    printf '%s\n' 'Igual a 10'
else
    printf '%s\n' 'Menor que 10'
fi
