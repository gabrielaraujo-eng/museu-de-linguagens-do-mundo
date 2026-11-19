#!/bin/bash
# Exercício 8: substituir todos os hífens por espaços.
texto='shell-script-em-Bash'
printf '%s\n' "${texto//-/ }"
