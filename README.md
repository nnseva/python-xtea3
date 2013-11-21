============
python-xtea3
============

Python wrapper to call xtea1/2/3 C implementations

What's new?

2013-11-21:

The first release

Base
----

NOTE: this package uses code got from http://ru.wikipedia.org/wiki/XTEA

Small package embedding open code of XTEA encoding/decoding algorithms branch to python.

Code example:

    import xtea
    print xtea.decipher(xtea.encipher('Hello XTEA!','1234567890123456'),'1234567890123456')
    print xtea.decipher(xtea.encipher('Hello XTEA!','1234567890123456',algorithm=2),'1234567890123456',algorithm=2)
    print xtea.decipher(xtea.encipher('Hello XTEA!','1234567890123456'*2,algorithm=3),'1234567890123456'*2,algorithm=3)
    print xtea.decipher(xtea.encipher('Hello XTEA!','1234567890123456'*2,algorithm=3,endian='>'),'1234567890123456'*2,algorithm=3,endian='>')

See also docstrings of encipher/decipher functions.

Install
-------

    sudo pip install git+git://github.com/nnseva/python-xtea3.git@master#egg=xtea


Roadmap
-------

Nothing important while no any more algorithm extentions


