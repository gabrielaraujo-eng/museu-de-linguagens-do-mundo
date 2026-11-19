#!/bin/bash
# Exercício 4: somar os inteiros de 1 a 5 com um laço Bash.
total=0
for valor in {1..5}; do
    (( total += valor ))
done
printf 'Soma: %d\n' "$total"
