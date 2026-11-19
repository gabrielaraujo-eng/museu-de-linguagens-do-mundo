#include <stdio.h>

int main(void) {
    /* scanf retorna quantos itens foram lidos com sucesso. */
    int value;
    fputs("Digite um inteiro: ", stdout);
    if (scanf("%d", &value) != 1) {
        fputs("Entrada inválida\n", stderr);
        return 1;
    }
    printf("Você digitou %d\n", value);
    return 0;
}
