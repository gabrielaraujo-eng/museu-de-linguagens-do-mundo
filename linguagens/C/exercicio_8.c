#include <stdio.h>
#include <string.h>

int main(void) {
    /* strlen conta bytes antes do terminador NUL. */
    const char text[] = "linguagem C";
    printf("Comprimento: %zu\n", strlen(text));
    return 0;
}
