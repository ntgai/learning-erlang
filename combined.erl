%% @author Natig Vahabov <me@ntg.ai> ntg.ai
%% @doc Functions calculating velocities achieved by objects
%% @version 0.1

-module(combined).
-export([height_to_mph/1]).
-import(functions, [fall_velocity/1]).
-import(convert, [mps_to_mph/1]).

%%% combines logic from other modules into a convenience function.
height_to_mph(Meters) -> mps_to_mph(fall_velocity(Meters)).