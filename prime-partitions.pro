

prime(A) :- 
  A > 1,
  prime2(2, A).

prime2(X, N) :- 
  X =< (sqrt(N)) -> (
    mod(N, X) =\= 0, 
    prime2(X + 1, N) 
  )
  ; true.

% prime2(X, N) :- not(divides(X, N)), prime2(X + 1, N).

divides(A, B) :- mod(B, A) is 0.

% gcd(A,B,G) :- A = B, G = A.
% gcd(A,B,G) :- A > B, C is A-B, gcd(C,B,G).
% gcd(A,B,G) :- B > A, C is B-A, gcd(C,A,G).