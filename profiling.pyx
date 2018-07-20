from functools import wraps
from time import time

def timing(f):
    @wraps(f)
    def wrap(*args, **kw):
        ts = time()
        result = f(*args, **kw)
        te = time()
        print ('func:%r args:[%r, %r] took: %2.4f sec' % \
          (f.__name__, args, kw, te-ts))
        return result
    return wrap

@timing
def fib(n):
    """Print the Fibonacci series up to n."""
    a, b = 0, 1
    while b < n:
        print(b),
        a, b = b, a + b

@timing
def fib_c(int n):
    """Print the Fibonacci series up to n."""
    cdef int a, b
    a, b = 0, 1
    while b < n:
        print(b),
        a, b = b, a + b

if __name__ == '__main__':
    fib(10000)
    fib_c(10000)