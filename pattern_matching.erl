-module(pattern_matching).
-export([fall_velocity/1, fall_velocity2/1]).

fall_velocity(Where) ->
	{Planemo, Distance} = Where,
	fall_velocity(Planemo, Distance).

fall_velocity2(Where) ->
	{Planemo, Distance} = Where,
	fall_velocity2(Planemo, Distance).

fall_velocity(Planemo, Distance) when Distance >= 0 ->
	case Planemo of
		earth -> math:sqrt(2*9.8*Distance);
		moon -> math:sqrt(2*1.6*Distance) % Doesn't have punctuation
	end.

fall_velocity2(Planemo, Distance) when Distance >= 0 ->
	
	Gravity = case Planemo of
		earth when Distance >= 0 -> 9.8;
		moon when Distance >= 0 -> 1.6
	end, % Has comma because case not ended yet

	Velocity = math:sqrt(2*Gravity*Distance),

	Description = if
		Velocity == 0 -> 'stable';
		Velocity < 5 -> 'slow';
		(Velocity >= 5) and (Velocity < 10) -> 'moving';
		Velocity >= 10, Velocity < 20 -> 'fast';
		Velocity >= 20 -> 'speedy'
	end,

	if
		(Velocity > 40) -> io:format("Look out below");
		true -> true
	end,

	Description.
