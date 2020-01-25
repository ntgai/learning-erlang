-module(exception_debug).
-export([fall_velocity/2]).

fall_velocity(Planemo, Distance) ->
	Gravity = case Planemo of
		earth -> 9.8;
		moon -> 1.6
	end,

	try math:sqrt(2 * Gravity * Distance)
	catch
		error: Error -> {error, Error};
		throw: Exception -> {error, Exception}
	end.

%% exception_debug:fall_velocity(earth, 20).
%% 19.79898987322333
%% exception_debug:fall_velocity(earth, -20).
%% {error,badarith}

% Logging
error_logger:info_msg("The value is ~p. ~n",[360]).
error_logger:warning_msg("Connection lost; will retry.").
error_logger:error_msg("Unable to read database.~n").

% Debugging
c(drop, [debug_info]).
debugger:start().

% Tracing Messages
c(drop).
c(mph_drop).
dbg:tracer().
Pid = spawn(mph_drop, mph_drop, []).
dbg:p(Pid, m)