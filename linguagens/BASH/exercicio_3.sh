#!/bin/bash
# Exercício 3: verificar a paridade de um inteiro predefinido.
numero=14
if (( numero % 2 == 0 )); then
    printf '%d é par.\n' "$numero"
else
    printf '%d é ímpar.\n' "$numero"
fi
