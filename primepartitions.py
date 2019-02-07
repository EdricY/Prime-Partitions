import sys
import math
 
 # IMPORTANT: this is NOT an efficient way to list prime partitions!
 
def is_prime(n):
    # returns True iff n is prime
    if n <= 1: return False
    for x in range(2, int(math.sqrt(n)) + 1):
        if n % x == 0: return False
    return True
 
def primes(a, b):
    # returns list of all primes between a and b (inclusive)
    return [i for i in range(a, b + 1) if is_prime(i)]
 
def prime_partitions(n, k=1, lst=[]):
    # print out all primes >k that sum to n
    # note: lst is a list of primes that we have attempted so far
    if n == 0:
        # remainder is 0 means sum(lst) == original number
        # in other words, lst is the prime partition
        # note: lst might be empty :)
        print(' + '.join(map(str, lst)))
    elif n > k:
        # might have primes that can contribute to partition
        for p in primes(k + 1, n):
            prime_partitions(n - p, p, lst + [p])
 
 # main loop: ask user for number, then print prime partitions
print("Prime Partitions Program")
while True:
    try:
        inp = input("Enter a number (non-number to quit): ")
        n = int(inp)
        prime_partitions(n)
    except:
        # leaving
        print('\n\nBye!')
        sys.exit(0)
