-module(package_tracker_mass_tests).
-include_lib("eunit/include/eunit.hrl").
-ifdef(EUNIT).

add_test() ->
    {setup,
    fun() ->
        meck:new(riakc_obj),
        meck:new(riakc_pb_socket),
        meck:expect(riakc_obj, new, fun(Bucket,Key,Value) -> done end),
        meck:expect(riakc_pb_socket, put, fun(Riak_pid,Request) -> worked end)
        
     end,
     fun(_) ->
        meck:unload(riakc_obj),
        meck:unload(riakc_pb_socket),
        ok
    end,
    [
        ?assertEqual(ok, package_tracker_mass_functions:request_location()),
        ?assertEqual(ok, package_tracker_mass_functions:register_package()),
        ?assertEqual(ok, package_tracker_mass_functions:vehicle_location_update()),
        ?assertEqual(ok, package_tracker_mass_functions:mark_deliver()),
        ?assertEqual(ok, package_tracker_mass_functions:put_on_vehicle()),
        ?assertEqual(ok, package_tracker_mass_functions:enter_center())
        
    ]}.

-endif.