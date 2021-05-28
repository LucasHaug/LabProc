#include <stdio.h>
#include <stdint.h>

int main() {
    uint32_t r1 = 0x1F;
    uint32_t r2 = 0x4;
    uint32_t r3 = 0;
    uint32_t r4 = r2;
    uint32_t r5 = 0;

    printf("Dividendo: %d\nDivisor: %d\nQuociente: %d\nResto: %d", r1, r2, r3, r5);

    printf("\n\n");

    while (r1 > r2) {
        r2 = r2 << 1;
    }

	while (r2 >= r4) {
        r3 = r3 << 1;

	    if (r1 >= r2) {
	        r1 = r1 - r2;
	        r3 = r3 + 1;
	    }

        r2 = r2 >> 1;
	}

	r5 = r1;

    printf("Dividendo: %d\nDivisor: %d\nQuociente: %d\nResto: %d", r1, r2, r3, r5);

    return 0;
}


