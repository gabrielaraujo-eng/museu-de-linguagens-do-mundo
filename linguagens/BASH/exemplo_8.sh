#!/bin/bash
# Substitui ocorrências de uma palavra na expansão da variável.
texto='Bash shell'
printf '%s\n' "${texto//shell/linguagem}"
