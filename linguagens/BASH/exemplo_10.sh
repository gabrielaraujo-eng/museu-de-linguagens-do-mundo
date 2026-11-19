#!/bin/bash
# sort é um utilitário externo (GNU Coreutils), não um builtin do Bash.
printf '%s\n' 'uva' 'maca' 'pera' | LC_ALL=C sort
