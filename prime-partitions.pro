prime(A) :- 
  A > 1,
  prime2(2, A).

prime2(X, N) :- 
  X =< (sqrt(N)) -> (
    mod(N, X) =\= 0,
    X1 is X + 1,
    prime2(X1, N) 
  )
  ; true.

% prime2(X, N) :- not(divides(X, N)), prime2(X + 1, N).

divides(A, B) :- mod(B, A) is 0.

% gcd(A,B,G) :- A = B, G = A.
% gcd(A,B,G) :- A > B, C is A-B, gcd(C,B,G).
% gcd(A,B,G) :- B > A, C is B-A, gcd(C,A,G).

bet(N, M, K) :- N =< M, K = N.
bet(N, M, K) :- N < M, N1 is N+1, bet(N1, M, K).

listBetween(L, A, B) :-
  findall(X, bet(A, B, X), L).

% this one can't generate the list
% listBetween2(L, A, B) :-
%   findall(X, (A =< X, B >= X), L).

listPrimesBetween(L, A, B) :-
  findall(X, (bet(A, B, X), prime(X)), L).