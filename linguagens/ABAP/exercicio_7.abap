* Exercício 7: Captura de erro de conversão
* Runtime: a conversão de ABC para inteiro deve ser executada para confirmar CX_SY_CONVERSION_ERROR.
REPORT z_exercise_7.

DATA: lv_str TYPE string VALUE 'ABC',
      lv_num TYPE i.

TRY.
    lv_num = lv_str.
  CATCH cx_sy_conversion_error.
    WRITE 'Erro: Não foi possível converter texto para número.'.
ENDTRY.
