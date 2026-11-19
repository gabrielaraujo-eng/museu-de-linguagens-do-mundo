#include <stdio.h>

int main(void) {
    /* Declara um inteiro e uma string C terminada por NUL. */
    int quantidade = 10;
    const char nome[] = "C";
    printf("%s: %d\n", nome, quantidade);
    return 0;
}
