#!/bin/bash
# A função escreve a soma na saída padrão; esse número não é seu status de saída.
soma() {
    printf '%s\n' "$(( $1 + $2 ))"
}

soma 2 3
