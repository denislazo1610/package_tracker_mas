%%%-------------------------------------------------------------------
%% @doc package_tracker_mass public API
%% @end
%%%-------------------------------------------------------------------

-module(package_tracker_mass_app).

-behaviour(application).

-export([start/2, stop/1]).

start(_StartType, _StartArgs) ->
    package_tracker_mass_sup:start_link().

stop(_State) ->
    ok.

%% internal functions
