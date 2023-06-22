-module(connection).

-export([connecting/0, creating_info/4, get_info/3, delete_info/3]).

connecting() ->
    try
        {ok, Pid} = riakc_pb_socket:start_link("104.248.112.47", 8087),
        case riakc_pb_socket:ping(Pid) of
            pong ->
                {ok, Pid};
            _Other ->
                {error, ping_failed}
        end
    catch
        error:{badmatch, {error, Reason}} ->
            io:format("Error connecting to Riak: ~p~n", [Reason]),
            {error, Reason}
    end.

creating_info(Pid, Bucket, Key, Value) ->
    Object = riakc_obj:new(Bucket, Key, Value),
    riakc_pb_socket:put(Pid, Object).

get_info(Pid, Bucket, Key) ->
    case riakc_pb_socket:get(Pid, Bucket, Key) of
        {ok, RObject} ->
            {ok, binary_to_term(riakc_obj:get_value(RObject))};
        {error, _Reason} = Error ->
            Error
    end.

delete_info(Pid, Bucket, Key) ->
    riakc_pb_socket:delete(Pid, Bucket, Key).