-module(ask_user_full).
-export([line/0]).

line() ->
	Planemo = get_planemo(),
	Distance = get_distance(),
	pattern_matching:fall_velocity({Planemo, Distance}).

get_planemo() -> 
	io:format("Where are you?~n"),
	io:format(" 1. Earth ~n"),
  	io:format(" 2. Earth's Moon~n"),
  	io:format(" 3. Mars~n"),
  	Answer = io:get_line("Which?~n"),

  	Value = hd(Answer), % built-in function hd/1, which pulls the first item from a string or list
  	char_to_planemo(Value).

char_to_planemo(Char) ->
	if
		[Char] == "1" -> earth; % char value checking
    	Char == $2 -> moon; % index checking
    	Char == 51 -> mars % ascii address checking
  	end.

%%% char_to_planemo($1) -> earth;
%%% char_to_planemo($2) -> moon;
%%% char_to_planemo($3) -> mars.


get_distance() ->
  	Input = io:get_line("How far? (meters) > "),
  	Value = string:strip(Input, right, $\n),
  		{Distance, _} = string:to_integer(Value),
 	Distance.