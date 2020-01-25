-module(recall).
-export([factorial_recursion/1, factorial_iteration/1, fibonacci/1, product/1]).

%%% ----------------------------------------------------------
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

%%% ----------------------------------------------------------
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


%%% ----------------------------------------------------------
% Process
report() ->
	receive
		X -> io:format("Received ~p~n", [X])
	end.

% c(test).
% Pid = spawn(test, report, []).
% is_process_alive(Pid). -> True
% Pid ! Hello -> Received Hello, Hello
% is_process_alive(Pid). -> False

report_without_terminated() ->
	receive
		X -> io:format("Received ~p~n", [X]),
		report_without_terminated()
	end.

report2(Count) ->
	NewCount = receive
		X -> io:format("Received #~p: ~p~n", [Count,X]),
			report2(Count + 1)
	end,
	report2(NewCount).

% Pid = spawn(test, report2, [1]).
% Pid ! "Hello". -> Received #1: "hello"
% Pid ! "It's me". -> Received #2: "It is me"
% Pid ! "I'm gonna be alright". -> Received #3: "I'm gonna be alright"

% register(test,Pid1).
% NewProcess = whereis(process).
% unregister(process)
% but NewProcess ! "There?" Still works

% Processes talk amongst themselves
-module(drop).
-export([drop/0]).

drop() ->
	receive
		{From, Planemo, Distance} ->
			From ! {Planemo, Distance, fall_velocity(Planemo, Distance)},
     	drop()
 	end.

fall_velocity(earth, Distance) when Distance >= 0  -> math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) when Distance >= 0 -> math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) when Distance >= 0 -> math:sqrt(2 * 3.71 * Distance).


-module(mph_drop).
-export([mph_drop/0]).

mph_drop() ->
  Drop=spawn(drop,drop,[]),
  convert(Drop).

convert(Drop) ->
	receive
		{Planemo, Distance} ->
     		Drop ! {self(), Planemo, Distance},
     		convert(Drop);
   		{Planemo, Distance, Velocity} ->
     		MphVelocity = 2.23693629 * Velocity,
     		io:format("On ~p, a fall of ~p meters yields a velocity of ~p mph.~n",
     		[Planemo, Distance, MphVelocity]),
     		convert(Drop)
 	end.


% Pid1 = spawn(drop,drop,[]).
% Pid1 ! {self(), moon, 20}.
% flush(). => Shell got {moon,20,8.0}