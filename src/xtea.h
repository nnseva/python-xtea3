#ifndef __XTEA__
#define __XTEA__

#include <cstring>

void xtea1_encipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k);
void xtea1_decipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k);

void xtea2_encipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k);
void xtea2_decipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k);

void xtea3_encipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k);
void xtea3_decipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k);

inline uint32_t rol(uint32_t base, uint32_t shift) {
        uint32_t res;
        /* only 5 bits of shift are significant*/
        shift &= 0x1F;
        res = (base << shift) | (base >> (32 - shift));
        return res;
}

#endif