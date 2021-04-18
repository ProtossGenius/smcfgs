import os
import ycm_core
 
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    '-DNDEBUG',
    '-std=c++2a',
    '-fcoroutines',
    '-x',
    'c++',
    '-I',
    '/usr/include',
    '-I',
    '/usr/local/include/',
    '-isystem',
    '/usr/include/c++/10',
    '-isystem',
    '/usr/include/c++/10/bits/',
  ]
 
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]
 
def FlagsForFile( filename, **kwargs ):
  return {
    'flags': flags,
    'do_cache': True
  }
