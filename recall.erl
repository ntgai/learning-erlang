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


% List Comprehensions
List = [1,2,4,8].
Square = fun(Value) -> Value*Value end.
Cube = fun(Value) -> math:pow(Value, 3) end.

lists:map(Square, List).
lists:map(Cube, List).

[Square(Value) || Value <- List].
[Value * Value || Value <- List].

Four_bits = fun(Value) -> (Value<16) and (Value>=0) end.
lists:filter(Four_bits, List).
[Value || Value <- List, Value<16, Value>=0].

Compare = fun(Value) -> Value > 10 end.
lists:any(Compare, List) % true
lists:all(Compare, List) % false
lists:partition(Compare, List) % {[16,32], [1,2,4,8]}

IsInt = fun(Value) -> is_integer(Value) end.
lists:all(IsInt, List).

lists:dropwhile(Compare, List). % [10, 16, 32]
lists:takewhile(Compare, List). % [1, 2, 4, 8]