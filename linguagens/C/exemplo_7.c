#include <stdio.h>

int main(void) {
    /* A falha de fopen é tratada sem desreferenciar um ponteiro nulo. */
    FILE *file = fopen("arquivo-que-nao-existe.txt", "r");
    if (file == NULL) {
        perror("Não foi possível abrir o arquivo");
        return 1;
    }
    fclose(file);
    return 0;
}
