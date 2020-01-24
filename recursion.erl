-module(recursion).
-export([countdown/1, countup/1, factorial/1]).

countdown(From) when From > 0 ->
	io:format("~w! ~n", [From]),
	countdown(From - 1);
countdown(From) ->
	io:format("blastoff! ~n").

%% count up
countup(Limit) ->
	countup(1, Limit).

countup(Count, Limit) when Count =< Limit ->
	io:format("~w!~n", [Count]),
	countup(Count+1, Limit);

countup(Count, Limit) ->
	io:format("Finished.~n").

%% factorial
factorial(N) ->
	factorial(N, 1).
factorial(N, Result) when N > 1 ->
	factorial(N-1, N*Result);
factorial(N, Result) when (N =< 1) and (N >= 0) ->
	Result.