#include <stdio.h>

int main(void) {
    /* Abra t.txt no diretório de trabalho e verifique falhas de I/O. */
    FILE *file = fopen("t.txt", "r");
    if (file == NULL) {
        perror("t.txt");
        return 1;
    }
    char line[256];
    if (fgets(line, sizeof line, file) != NULL) {
        fputs(line, stdout);
    }
    if (ferror(file)) {
        perror("Falha ao ler t.txt");
        fclose(file);
        return 1;
    }
    fclose(file);
    return 0;
}
