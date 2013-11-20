from libc.stdint cimport * 
from libc.string cimport memcpy
from libcpp.string cimport string
from cython.operator cimport dereference as deref, preincrement as inc

# -------------------------------------------------------------------
# XTEA
# -------------------------------------------------------------------
cdef extern from "xtea.h":
    cdef void xtea1_bencipher(unsigned num_rounds, char *v, char *k)
    cdef void xtea1_bdecipher(unsigned num_rounds, char *v, char *k)
    cdef void xtea2_bencipher(unsigned num_rounds, char *v, char *k)
    cdef void xtea2_bdecipher(unsigned num_rounds, char *v, char *k)
    cdef void xtea3_bencipher(unsigned num_rounds, char *v, char *k)
    cdef void xtea3_bdecipher(unsigned num_rounds, char *v, char *k)

cdef enum: KSZ1 = 4
cdef enum: VSZ1 = 2
cdef enum: KSZ2 = 4
cdef enum: VSZ2 = 4
cdef enum: KSZ3 = 8
cdef enum: VSZ3 = 4

def encipher1(unsigned num_rounds, v, k):
        assert len(v) == VSZ1*4
        assert len(k) == KSZ1*4
        cdef char *v0 = v
        cdef char vv[VSZ1*4]
        memcpy(vv,v0,VSZ1*4)
        xtea1_bencipher(num_rounds,vv,k)
        return string(vv,VSZ1*4)
def decipher1(unsigned num_rounds, v, k):
        assert len(v) == VSZ1*4
        assert len(k) == KSZ1*4
        cdef char *v0 = v
        cdef char vv[VSZ1*4]
        memcpy(vv,v0,VSZ1*4)
        xtea1_bdecipher(num_rounds,vv,k)
        return string(vv,VSZ1*4)

def encipher2(unsigned num_rounds, v, k):
        assert len(v) == VSZ2*4
        assert len(k) == KSZ2*4
        cdef char *v0 = v
        cdef char vv[VSZ2*4]
        memcpy(vv,v0,VSZ2*4)
        xtea2_bencipher(num_rounds,vv,k)
        return string(vv,VSZ2*4)
def decipher2(unsigned num_rounds, v, k):
        assert len(v) == VSZ2*4
        assert len(k) == KSZ2*4
        cdef char *v0 = v
        cdef char vv[VSZ2*4]
        memcpy(vv,v0,VSZ2*4)
        xtea2_bdecipher(num_rounds,vv,k)
        return string(vv,VSZ2*4)

def encipher3(unsigned num_rounds, v, k):
        assert len(v) == VSZ3*4
        assert len(k) == KSZ3*4
        cdef char *v0 = v
        cdef char vv[VSZ3*4]
        memcpy(vv,v0,VSZ3*4)
        xtea3_bencipher(num_rounds,vv,k)
        return string(vv,VSZ3*4)
def decipher3(unsigned num_rounds, v, k):
        assert len(v) == VSZ3*4
        assert len(k) == KSZ3*4
        cdef char *v0 = v
        cdef char vv[VSZ3*4]
        memcpy(vv,v0,VSZ3*4)
        xtea3_bdecipher(num_rounds,vv,k)
        return string(vv,VSZ3*4)
