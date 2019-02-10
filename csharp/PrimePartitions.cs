using System;
using System.Collections.Generic;
using System.Linq;

class PrimePartitions
{
    bool isPrime(int n)
    {
        if (n <= 1)
        {
            return false;
        }
        for (int x = 2; x < (int) (Math.Sqrt(n) + 1); x++)
        {
            if (n % x == 0)
            {
                return false;
            }
        }
        return true;
    }

    List<int> primes(int a, int b)
    {
        List<int> primes = new List<int>();
        for (int i = a; i < b+1; i++)
        {
            if (isPrime(i))
            {
                primes.Add(i);
            }
        }
        return primes;
    }

    void prime_partitions(int n, int k, List<int> lst)
    {
        if (n == 0)
        {
            for (int i = 0; i < lst.Count - 1; i++)
            {
                Console.Write(lst.ElementAt(i) + " + ");
            }
            Console.WriteLine(lst.Last());
        }
        else if (n > k)
        {
            foreach (int p in primes(k+1, n))
            {
                List<int> newPrime = new List<int>(lst);
                newPrime.Add(p);
                prime_partitions(n - p, p, newPrime);
            }
        }
    }

    static void Main(string[] args)
    {
        PrimePartitions program = new PrimePartitions();
        bool loop = true;
        while (loop)
        {
            Console.Write("Enter a number (non-number to quit): ");
            string number = Console.ReadLine();
            int n;
            if (Int32.TryParse(number, out n))
            {
                program.prime_partitions(n, 1, new List<int>());
            } else
            {
                loop = false;
            }
        }
    }
}
