@echo off
rem Exercicio 7: detecte e trate o codigo de retorno nao zero.
call :falhar_controlado
if errorlevel 1 (
    echo Codigo de erro detectado e tratado.
    exit /b 0
)
echo O codigo de erro nao foi retornado.
exit /b 1

:falhar_controlado
rem Retorna deliberadamente o codigo 1 sem alterar arquivos ou recursos.
exit /b 1
