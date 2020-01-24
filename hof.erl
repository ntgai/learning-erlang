-module(hof).
-export([tripler/2]).

tripler(Value, Function) -> 3 * Function(Value).
% fall_velocity_earth = fun(Distance) -> 2 * 9.8 * Distance end.
% hof:tripler(fall_velocity_earth, 20).
% or hof:tripler(6,fun(Value)->20*Value end).
% or hof:tripler(math:pi(), fun math:cos/1).

% Print = fun(Value) -> io:format(" ~p~n", [Value]).
% List = [1,2,3,4,5]
% lists:foreach(Print, List) %1\n 2\n 3\n 4\n 5\n

List = [1,2,4,8].
Square = fun(Value) -> Value*Value end.
Cube = fun(Value) -> math:pow(Value, 3) end.

lists:map(Square, List).
lists:map(Cube, List).

% List Comprehension
[Square(Value) || Value <- List].
[Value * Value || Value <- List].

% List Filtering
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

% CLOSURE
% X = 20.
% MyFunction = fun(Value) -> X * Value end.
% f(X).
% X. unbound
% hof:tripler(6, MyFunction). 360 - it stores value of X even if already vanished.

