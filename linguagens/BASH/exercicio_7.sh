#!/bin/bash
# Exercício 7: validar acesso de leitura; aceite opcionalmente um caminho.
arquivo=${1:-/dev/null}
if [[ ! -r "$arquivo" ]]; then
    printf 'Não é possível ler: %s\n' "$arquivo" >&2
    exit 1
fi
printf 'Leitura permitida: %s\n' "$arquivo"
