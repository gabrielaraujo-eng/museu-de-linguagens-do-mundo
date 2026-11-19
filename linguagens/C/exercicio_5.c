#include <stdio.h>

/* Troca os valores apontados pelos dois ponteiros. */
static void swap(int *left, int *right) {
    const int temporary = *left;
    *left = *right;
    *right = temporary;
}

int main(void) {
    int a = 3;
    int b = 8;
    swap(&a, &b);
    printf("a=%d, b=%d\n", a, b);
    return 0;
}
