* Exemplo 7: Tratamento de Exceções em ABAP
* Runtime: a divisão por zero deve ser executada em um sistema ABAP para confirmar CX_SY_ZERODIVIDE.
REPORT z_exception_handling.

DATA: lv_result TYPE i.

TRY.
    lv_result = 10 / 0.
  CATCH cx_sy_zerodivide.
    WRITE 'Erro: Divisão por zero detectada!'.
ENDTRY.
