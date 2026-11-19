#include <stdio.h>

int main(void) {
    /* snprintf limita a escrita ao tamanho do buffer. */
    char full[32];
    const int written = snprintf(full, sizeof full, "%s %s", "Olá", "mundo");
    if (written < 0 || (size_t)written >= sizeof full) {
        fputs("Texto não coube no buffer\n", stderr);
        return 1;
    }
    puts(full);
    return 0;
}
