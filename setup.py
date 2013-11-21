from distutils.core import setup
from distutils.extension import Extension
from glob import glob
from Cython.Distutils import build_ext
import os

#BUILD_ROOT=os.path.dirname(os.path.realpath(__file__))
BUILD_ROOT='.'
SRC=os.path.join(BUILD_ROOT, 'src')

ext_modules=[
    Extension("_xtea",
            define_macros=[],
            undef_macros=[],
            sources=glob(os.path.join(SRC, "*.pyx"))+glob(os.path.join(SRC, "*.cxx")),
            include_dirs=[SRC],
            language='c++',
            libraries=['m'],
            extra_compile_args=["-DHAVE_LONG_LONG"]
    )
]

py_modules=[
    'xtea',
]

setup(
  name = "xtea",
  author = "Vsevolod Novikov",
  author_email = "nnseva@gmail.com",
  url = "http://localhost",
  version = "0.1",  
  cmdclass = {"build_ext": build_ext},
  py_modules = py_modules,
  ext_modules = ext_modules,
)
