-module(ask).
-export([term/0, chars/0]).

term() ->
  Input = io:read("What {planemo, distance} ? >>"),
  process_term(Input).

process_term({ok, Term}) when is_tuple(Term) ->
  Velocity = drop:fall_velocity(Term),
  io:format("Yields ~w. ~n",[Velocity]),
  term();

process_term({ok, quit}) ->
  io:format("Goodbye.~n");
  % does not call term() again

process_term({ok, _}) ->
  io:format("You must enter a tuple.~n"),
  term();

process_term({error, _}) ->
  io:format("You must enter a tuple with correct syntax.~n"),
  term().

% getting option from the user
chars() ->
	io:format("Which planemo are you on? ~n"),
	io:format(" 1. Earth ~n"),
  	io:format(" 2. Earth's Moon~n"),
  	io:format(" 3. Mars~n"),
  	io:get_chars("Which? > ",1).