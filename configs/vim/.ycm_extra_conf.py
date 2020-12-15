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
    '-isystem',
    '/usr/lib/gcc/x86_64-linux-gnu/5/include',
    '-isystem',
    '/usr/include/x86_64-linux-gnu',
    '-isystem'
    '/usr/include/c++/7',
    '-isystem',
    '/usr/include/c++/7/bits',
    '-isystem'
    '/usr/include/c++/9',
    '-isystem',
    '/usr/include/c++/9/bits',
    '-isystem',
    '/usr/local/include/c++/10.2.0/bits/',
  ]
 
SOURCE_EXTENSIONS = [ '.cpp', '.cxx', '.cc', '.c', ]
 
def FlagsForFile( filename, **kwargs ):
  return {
    'flags': flags,
    'do_cache': True
  }
