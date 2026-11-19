#include <stdio.h>

/* Retorna o quadrado de um inteiro. */
static int square(int value) {
    return value * value;
}

int main(void) {
    printf("4 ao quadrado = %d\n", square(4));
    return 0;
}
