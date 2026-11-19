#include <stdio.h>
#include <stdlib.h>

int main(void) {
    /* malloc reserva memória; o ponteiro deve ser verificado e liberado. */
    int *value = malloc(sizeof *value);
    if (value == NULL) {
        fputs("Falha na alocação\n", stderr);
        return 1;
    }
    *value = 42;
    printf("Valor: %d\n", *value);
    free(value);
    return 0;
}
