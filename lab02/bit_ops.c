#include <stdio.h>
#include "bit_ops.h"
//bitwise operations such as and (&), or (|), xor (^), not (~), left shifts (<<), and right shifts (>>)   1001110,  0
/* Returns the Nth bit of X. Assumes 0 <= N <= 31. */
unsigned get_bit(unsigned x, unsigned n) {
    /* YOUR CODE HERE */
    // return -1; /* UPDATE WITH THE CORRECT RETURN VALUE*/
    unsigned y = (x >> n) & 1;
    return y;
}

/* Set the nth bit of the value of x to v. Assumes 0 <= N <= 31, and V is 0 or 1 */
void set_bit(unsigned *x, unsigned n, unsigned v) {
    /* YOUR CODE HERE */
      *x &= ~(1 << n); 
     *x |= (v << n); 
  
}

/* Flips the Nth bit in X. Assumes 0 <= N <= 31.*/
void flip_bit(unsigned *x, unsigned n) {
    /* YOUR CODE HERE */
    *x = *x ^ (1 << n);
}





