#!/bin/bash
# Exercício 6: exibir quantidade e elementos de um array indexado.
cores=('azul' 'verde' 'vermelho')
printf 'Quantidade: %d\n' "${#cores[@]}"
printf '%s\n' "${cores[@]}"
