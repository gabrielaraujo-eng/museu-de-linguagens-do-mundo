#!/bin/bash
# Verifica a legibilidade de um caminho recebido; /dev/null é o padrão benigno.
arquivo=${1:-/dev/null}
if [[ ! -r "$arquivo" ]]; then
    printf 'Não é possível ler: %s\n' "$arquivo" >&2
    exit 1
fi
printf 'Arquivo legível: %s\n' "$arquivo"
