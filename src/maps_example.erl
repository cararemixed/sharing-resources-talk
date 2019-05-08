-module(maps_example).

-export([
    new_map/0,
    update_value/2,
    add_key/1
]).


new_map() ->
    #{answer => 42}.


update_value(Map, Value) ->
    Map#{answer := Value}.


add_key(Map) ->
    Map#{other => value}.
