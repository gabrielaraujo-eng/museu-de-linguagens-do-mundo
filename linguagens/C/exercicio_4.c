#include <stdio.h>

int main(void) {
    /* while repete o bloco enquanto a condição for verdadeira. */
    int value = 3;
    while (value > 0) {
        printf("%d\n", value);
        --value;
    }
    return 0;
}
