(define (isPrime n) 
  (isPrime2 n 2)
)

(define (isPrime2 n x) 
  (cond 
    ((> x (sqrt n)) true)
    ((= 0 (modulo n x)) false)
    (else (isPrime2 n (+ 1 x)))
  )
)


(define (primes a b)
  (if (> a b) 
    '()
    (if (isPrime a) 
      (cons a (primes (+ 1 a) b))
      (primes (+ 1 a) b)
    )
  )
)

(define (prime-partitions n k lst)
  (cond 
    ((= n 0) (display-partition lst))
    ((> n k) (map (lambda (p)
        (prime-partitions (- n p) p (cons p lst))
        )
        (primes (+ 1 k) n)
      )
    )
  )
)

(define (display-partition lst)
  (if (null? (cdr lst)) 
    (display (string-append(number->string (car lst)) "\n"))
    (begin
      (display (string-append (number->string (car lst)) " + "))
      (display-partition (cdr lst))
    )
  )
)


(display "\nEnter a number: ")
(prime-partitions (read) 1 '())

