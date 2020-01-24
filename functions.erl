-module(functions).
-export([fall_velocity/1]). % there will be more

%% @doc Calculates the velocity of an object falling on Earth
%% as if it were in a vacuum (no air resistance).  The distance is
%% the height from which the object falls, specified in meters,
%% and the function returns a velocity in meters per second.

-spec(fall_velocity(number()) -> number()).

fall_velocity(Distance) -> math:sqrt(2 * 9.8 * Distance).