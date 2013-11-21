from libc.stdint cimport * 
from cython.operator cimport dereference as deref, preincrement as inc

# -------------------------------------------------------------------
# XTEA
# -------------------------------------------------------------------
cdef extern from "xtea.h":
    cdef void xtea1_encipher(unsigned num_rounds, uint32_t *v, uint32_t *k)
    cdef void xtea1_decipher(unsigned num_rounds, uint32_t *v, uint32_t *k)
    cdef void xtea2_encipher(unsigned num_rounds, uint32_t *v, uint32_t *k)
    cdef void xtea2_decipher(unsigned num_rounds, uint32_t *v, uint32_t *k)
    cdef void xtea3_encipher(unsigned num_rounds, uint32_t *v, uint32_t *k)
    cdef void xtea3_decipher(unsigned num_rounds, uint32_t *v, uint32_t *k)

cdef enum: KSZ1 = 4
cdef enum: VSZ1 = 2
cdef enum: KSZ2 = 4
cdef enum: VSZ2 = 4
cdef enum: KSZ3 = 8
cdef enum: VSZ3 = 4

def encipher01(unsigned num_rounds, v, k):
        assert len(v) == VSZ1
        assert len(k) == KSZ1
        cdef uint32_t vv[VSZ1]
        cdef uint32_t kk[KSZ1]
        for i in xrange(VSZ1): vv[i] = v[i]
        for i in xrange(KSZ1): kk[i] = k[i]
        xtea1_encipher(num_rounds,vv,kk)
        return [vv[i] for i in xrange(VSZ1)]
def decipher01(unsigned num_rounds, v, k):
        assert len(v) == VSZ1
        assert len(k) == KSZ1
        cdef uint32_t vv[VSZ1]
        cdef uint32_t kk[KSZ1]
        for i in xrange(VSZ1): vv[i] = v[i]
        for i in xrange(KSZ1): kk[i] = k[i]
        xtea1_decipher(num_rounds,vv,kk)
        return [vv[i] for i in xrange(VSZ1)]

def encipher02(unsigned num_rounds, v, k):
        assert len(v) == VSZ2
        assert len(k) == KSZ2
        cdef uint32_t vv[VSZ2]
        cdef uint32_t kk[KSZ2]
        for i in xrange(VSZ2): vv[i] = v[i]
        for i in xrange(KSZ2): kk[i] = k[i]
        xtea2_encipher(num_rounds,vv,kk)
        return [vv[i] for i in xrange(VSZ2)]
def decipher02(unsigned num_rounds, v, k):
        assert len(v) == VSZ2
        assert len(k) == KSZ2
        cdef uint32_t vv[VSZ2]
        cdef uint32_t kk[KSZ2]
        for i in xrange(VSZ2): vv[i] = v[i]
        for i in xrange(KSZ2): kk[i] = k[i]
        xtea2_decipher(num_rounds,vv,kk)
        return [vv[i] for i in xrange(VSZ2)]

def encipher03(unsigned num_rounds, v, k):
        assert len(v) == VSZ3
        assert len(k) == KSZ3
        cdef uint32_t vv[VSZ3]
        cdef uint32_t kk[KSZ3]
        for i in xrange(VSZ3): vv[i] = v[i]
        for i in xrange(KSZ3): kk[i] = k[i]
        xtea3_encipher(num_rounds,vv,kk)
        return [vv[i] for i in xrange(VSZ3)]
def decipher03(unsigned num_rounds, v, k):
        assert len(v) == VSZ3
        assert len(k) == KSZ3
        cdef uint32_t vv[VSZ3]
        cdef uint32_t kk[KSZ3]
        for i in xrange(VSZ3): vv[i] = v[i]
        for i in xrange(KSZ3): kk[i] = k[i]
        xtea3_decipher(num_rounds,vv,kk)
        return [vv[i] for i in xrange(VSZ3)]
