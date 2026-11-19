@echo off
set "x=10"
if %x% GTR 10 (
    echo Maior que 10
) else (
    if %x% EQU 10 (
        echo Igual a 10
    ) else (
        echo Menor que 10
    )
)
