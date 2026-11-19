#include <stdio.h>

struct Node {
    int value;
    struct Node *next;
};

int main(void) {
    /* Dois nós na pilha ilustram a ligação entre elementos. */
    struct Node second = {2, NULL};
    struct Node first = {1, &second};
    for (const struct Node *node = &first; node != NULL; node = node->next) {
        printf("%d\n", node->value);
    }
    return 0;
}
