'''
XTEA
'''

import _xtea

algorithms = {
    1:(
        _xtea.encipher01,
        _xtea.decipher01,
        2,4
    ),
    '1':(
        _xtea.encipher01,
        _xtea.decipher01,
        2,4
    ),
    'xtea1':(
        _xtea.encipher01,
        _xtea.decipher01,
        2,4
    ),
    'xtea-1':(
        _xtea.encipher01,
        _xtea.decipher01,
        2,4
    ),

    2:(
        _xtea.encipher02,
        _xtea.decipher02,
        4,4
    ),
    '2':(
        _xtea.encipher02,
        _xtea.decipher02,
        4,4
    ),
    'xtea2':(
        _xtea.encipher02,
        _xtea.decipher02,
        4,4
    ),
    'xtea-2':(
        _xtea.encipher02,
        _xtea.decipher02,
        4,4
    ),

    3:(
        _xtea.encipher03,
        _xtea.decipher03,
        4,8
    ),
    '3':(
        _xtea.encipher03,
        _xtea.decipher03,
        4,8
    ),
    'xtea3':(
        _xtea.encipher03,
        _xtea.decipher03,
        4,8
    ),
    'xtea-3':(
        _xtea.encipher03,
        _xtea.decipher03,
        4,8
    ),

}

import struct

def encipher(data,key,algorithm=1,num_blocks=32,endian='!'):
    '''
    encipher(data,key,algorithm=1,num_blocks=32,endian='!')

    data is any string which will be padded by zeros up to the block boundary
    key should be string of exact key length (16 for xtea-1 and xtea-2 and 32 for xtea-3)
    algorithm may be any numeric or string identification of algorithm
    num_blocks is passed to the algorithm
    endian is used to encode/decode passed data and key to integers required by the algorithm
    '''
    e,d,vsz,ksz = algorithms[algorithm]
    k = struct.unpack(endian+'%sL' % ksz,key)
    vup = endian+'%sL' % vsz
    o = (vsz*4 - len(data) % (vsz*4))
    data = data + '\0'*o
    r = []
    while data:
        r.append(struct.pack(vup,*e(num_blocks, struct.unpack(vup,data[:vsz*4]), k)))
        data = data[vsz*4:]
    return ''.join(r)

def decipher(data,key,algorithm=1,num_blocks=32,endian='!'):
    '''
    decipher(data,key,algorithm=1,num_blocks=32,endian='!')

    data is encoded previously string
    key should be string of exact key length (16 for xtea-1 and xtea-2 and 32 for xtea-3)
    algorithm may be any numeric or string identification of algorithm
    num_blocks is passed to the algorithm
    endian is used to encode/decode passed data and key to integers required by the algorithm
    '''
    e,d,vsz,ksz = algorithms[algorithm]
    k = struct.unpack(endian+'%sL' % ksz,key)
    vup = endian+'%sL' % vsz
    r = []
    while data:
        r.append(struct.pack(vup,*d(num_blocks, struct.unpack(vup,data[:vsz*4]), k)))
        data = data[vsz*4:]
    return ''.join(r)
