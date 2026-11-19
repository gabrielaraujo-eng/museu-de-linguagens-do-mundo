@echo off
call :retornar_erro
if errorlevel 1 (
    echo A sub-rotina retornou um codigo de erro.
    exit /b 0
)
echo Nenhum erro foi retornado.
exit /b 1

:retornar_erro
rem Retorna deliberadamente o codigo 1 para demonstrar IF ERRORLEVEL.
exit /b 1
