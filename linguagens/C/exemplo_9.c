#include <math.h>
#include <stdio.h>

int main(void) {
    /* sqrt é declarada em math.h; algumas toolchains exigem -lm no link. */
    const double result = sqrt(16.0);
    printf("sqrt(16) = %.1f\n", result);
    return 0;
}
