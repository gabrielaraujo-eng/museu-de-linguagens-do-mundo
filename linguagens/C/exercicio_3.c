#include <stdio.h>

int main(void) {
    /* switch escolhe um ramo a partir do valor da expressão. */
    const int option = 2;
    switch (option) {
        case 1:
            puts("Opção 1");
            break;
        case 2:
            puts("Opção 2");
            break;
        default:
            puts("Outra opção");
            break;
    }
    return 0;
}
