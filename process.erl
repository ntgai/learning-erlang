-module(process).
-export([report/1]).

%Pid = self().
%Pid ! test1.
%Pid ! test2.
%flush(). % pop up test1, test2 and removed them

%Pid ! 23.
%receive X->X end.

%Pid ! 22.
%receive Y>2*Y end.
%22
%Pid ! 22.
%receive Y>2*Y end.
%22
%Pid ! 23.
%receive Y>2*Y end.
%Stuck.....


report(Count) ->
	NewCount = receive
		X -> io:format("Received #~p: ~p~n",[Count,X]),
			Count + 1
  	end,
  	report(NewCount).

% c(process).
% Pid2 = spawn(process,report,[1]).
% Pid2 ! test.
% Received #1: test
% test

% register(process,Pid2).
% process ! "Hell".

% GetBounce = whereis(process).
% unregister(process).
% GetBounce ! "Still there?".
% Received #3: "Still there?"

% If you want to see which processes are registered, you can use the regs()

% register(test,Pid1).
% NewProcess = whereis(process).
% unregister(process)
% but NewProcess ! "There?" Still works

% Processes talk amongst themselves

drop() ->
	receive
		{From, Planemo, Distance} ->
			From ! {Planemo, Distance, fall_velocity(Planemo, Distance)},
     	drop()
 	end.

fall_velocity(earth, Distance) when Distance >= 0  -> math:sqrt(2 * 9.8 * Distance);
fall_velocity(moon, Distance) when Distance >= 0 -> math:sqrt(2 * 1.6 * Distance);
fall_velocity(mars, Distance) when Distance >= 0 -> math:sqrt(2 * 3.71 * Distance).

% Pid1 = spawn(test,drop,[]).
% Pid1 ! {self(), moon, 20}.
% flush(). => Shell got {moon,20,8.0}

