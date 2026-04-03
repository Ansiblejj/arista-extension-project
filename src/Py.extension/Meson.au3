project('my extensions', 'cython', 'c', 'pyx', 'sw')

py = import('python').find_installation(pure: false)

py.extension_module(
   'foo',
   'foo.pyx',
   install: true
)
