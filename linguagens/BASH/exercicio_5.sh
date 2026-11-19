#!/bin/bash
# Exercício 5: definir e chamar uma função de multiplicação.
produto() {
    printf '%s\n' "$(( $1 * $2 ))"
}
resultado=$(produto 4 6)
printf 'Produto: %s\n' "$resultado"
