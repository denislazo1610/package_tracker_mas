-module(package_tracker_mass_functions).
-export([request_location/0, register_package/0, vehicle_location_update/0, mark_deliver/0, put_on_vehicle/0, enter_center/0]).
% -export([tests/0]).

% is_list(list) returns if list is a list

% ["package", "id of package", "{location, time}"]

request_location() ->
    % PULL INFO (place where is the package)
    ok.

register_package() ->
    % Create bucket
    ok.

vehicle_location_update() ->
    % PULL info (where is the truck)
    ok.

mark_deliver() ->
    % MODIFY BUcket (move, distribution,)
    ok.

put_on_vehicle() ->
    % MOdify 
    ok.

enter_center() ->
    ok.