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

// TODO: little-endian only, endian is valuable while conversion!
inline void xtea1_bencipher(unsigned int num_rounds, char *v, char *k) {
    xtea1_encipher(num_rounds,(uint32_t *)(void *)v, (uint32_t const *)(void const *)k);
}
inline void xtea1_bdecipher(unsigned int num_rounds, char *v, char *k) {
    xtea1_decipher(num_rounds,(uint32_t *)(void *)v, (uint32_t const *)(void const *)k);
}

inline void xtea2_bencipher(unsigned int num_rounds, char *v, char *k) {
    xtea2_encipher(num_rounds,(uint32_t *)(void *)v, (uint32_t const *)(void const *)k);
}
inline void xtea2_bdecipher(unsigned int num_rounds, char *v, char *k) {
    xtea2_decipher(num_rounds,(uint32_t *)(void *)v, (uint32_t const *)(void const *)k);
}

inline void xtea3_bencipher(unsigned int num_rounds, char *v, char *k) {
    xtea3_encipher(num_rounds,(uint32_t *)(void *)v, (uint32_t const *)(void const *)k);
}
inline void xtea3_bdecipher(unsigned int num_rounds, char *v, char *k) {
    xtea3_decipher(num_rounds,(uint32_t *)(void *)v, (uint32_t const *)(void const *)k);
}


#endif