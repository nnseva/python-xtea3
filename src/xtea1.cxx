// Got from http://ru.wikipedia.org/wiki/XTEA
#include <stdint.h>
#include <xtea.h>
 
void xtea1_encipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k)
{
        unsigned int i;
        uint32_t y, z, sum=0, delta=0x9E3779B9;
        /* load and pre-white the registers */
        y = v[0] + k[0];
        z = v[1] + k[1];
        /* Round functions */
        for (i = 0; i < num_rounds; i++) 
        {
                y += ((z << 4) ^ (z >> 5)) + (z ^ sum) + rol(k[sum & 3], z);
                sum += delta;
                z += ((y << 4) ^ (y >> 5)) + (y ^ sum) + rol(k[(sum >> 11) & 3], y);
        }
        /* post-white and store registers */
        v[0] = y ^ k[2];
        v[1] = z ^ k[3];
}
 
void xtea1_decipher(unsigned int num_rounds,uint32_t *v, uint32_t const *k)
{
        unsigned int i;
        uint32_t y, z,delta=0x9E3779B9,sum=delta*num_rounds;
        z = v[1] ^ k[3];
        y = v[0] ^ k[2];
        for (i = 0; i < num_rounds; i++) 
        {
                z -= ((y << 4) ^ (y >> 5)) + (y ^ sum) + rol(k[(sum >> 11) & 3], y);
                sum -= delta;
                y -= ((z << 4) ^ (z >> 5)) + (z ^ sum) + rol(k[sum & 3], z);
 
        }
        v[1] = z - k[1];
        v[0] = y - k[0];
}
