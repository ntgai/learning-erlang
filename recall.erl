-module(recall).
-export([factorial_recursion/1, factorial_iteration/1, fibonacci/1, product/1]).

%% Factorial - recursion
factorial_recursion(Number) -> factorial_recursion(Number, 1).
factorial_recursion(Number, Result) when (Number == 0) or (Number == 1) -> Result;
factorial_recursion(Number, Result) when Number > 1 ->
	factorial_recursion(Number - 1, Number * Result).

%% Factorial - iteration
factorial_iteration(Number) when (Number == 1) or (Number == 0) -> 1;
factorial_iteration(Number) when (Number >= 2) -> 
	factorial_iteration(1, lists:seq(2,Number)).
factorial_iteration(Res, []) -> Res;
factorial_iteration(Res, [H|T]) -> factorial_iteration(Res*H, T).

%% simple factorial
fac(0) -> 1;
fac(N) when N > 0 -> N*fac(N-1).

%% Fibonacci nth number
%% 6th, 1 1 2 3 5 8 -> 8
fibonacci(X) when X =< 2 -> 1;
fibonacci(X) -> fibonacci(X-1) + fibonacci(X-2).

%% Multiply elements of List
product([]) -> 0;
product(List) -> product(1, List).

product(Res, []) -> Res.
product(Res, [H|T]) -> product(Res * H, T).