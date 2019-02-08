prime(A) :- 
  A > 1,
  prime2(2, A).

prime2(X, N) :-
  X > sqrt(N) -> true ;
  mod(N, X) =\= 0,
  X1 is X + 1,
  prime2(X1, N).

divides(A, B) :- mod(B, A) is 0.

listPrimesBetween(L, A, B) :-
  findall(X, (between(A, B, X), prime(X)), L).

listEmpty([]).

% https://stackoverflow.com/questions/9875760/sum-of-elements-in-list-in-prolog
sum([H|T], S) :-
  sum(T, X),
  S is H + X.

sum([], 0).

isPrimePartition(N, L) :-
  sum(L, N),
  maplist(prime, L).

% http://eclipseclp.org/doc/bips/lib/lists/subset-2.html
% mySubset(?Sublist, +List)
mySubset([], []).
mySubset([X|L],[X|S]) :- mySubset(L, S).
mySubset(L, [_|S]) :- mySubset(L, S).

primePartition(N, L) :-
  listPrimesBetween(PS, 2, N),
  mySubset(L, PS),
  sum(L, N).


% unused
sum1(L, S) :-
  sum2(L, 0, S).

sum2([H|T], X, S) :-
  listEmpty(T) -> (
    Temp is X + H,
    Temp = S
  ) ; (
    Temp is X + H,
    sum2(T, Temp, S)
  ).
