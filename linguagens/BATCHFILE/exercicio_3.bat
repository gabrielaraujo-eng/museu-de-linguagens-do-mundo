@echo off
rem Exercicio 3: compare o valor com 10 e trate os tres casos.
set "numero=10"
if %numero% GTR 10 (
    echo Maior que 10
) else (
    if %numero% EQU 10 (
        echo Igual a 10
    ) else (
        echo Menor que 10
    )
)
