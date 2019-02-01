const NUMBER = 42; 
console.log("JS Prime Partitions Program");
primePartitions(NUMBER);

// this is NOT an efficient way to list prime partitions!

function isPrime(n) {
  // returns true iff n is prime
  if (n <= 1) return false;
  for (let x = 2; x < Math.floor(Math.sqrt(n)) + 1; x++) {
    if (n % x == 0) return false;
  }
  return true;
}

function primes(a, b) {
  let arr = [];
  for (let i = a; i <= b; i++) {
    if (isPrime(i)) {
      arr.push(i);
    }
  }
  return arr;
}

function primePartitions(n, k=1, lst=[]) {
  // print out all primes > k that sum to n
  // note: lst is a list of primes that we have attempted so far
  if (n == 0) {
    console.log(lst.join(' + '));
  } else if (n > k) {
    let ps = primes(k + 1, n)
    for (let p of ps) {
      let copy_lst = JSON.parse(JSON.stringify(lst));
      copy_lst.push(p);
      primePartitions(n - p, p, copy_lst);
    }
  }
}
