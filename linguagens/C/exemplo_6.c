#include <stdio.h>

int main(void) {
    /* Um array guarda vários valores do mesmo tipo. */
    const int values[] = {1, 2, 3};
    const size_t count = sizeof values / sizeof values[0];
    for (size_t i = 0; i < count; ++i) {
        printf("%d%s", values[i], i + 1 == count ? "\n" : ", ");
    }
    return 0;
}
