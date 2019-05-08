-module(records).

-export([
    new/0,
    do_thing/1,
    get_count/1
]).

-record(fancy_counter, {
    ref = make_ref(),
    timestamp = now(),
    count = 0,
    extra % defaults to the atom `undefined`
}).


new() ->
    #fancy_counter{}.


do_thing(#fancy_counter{count = Count} = Counter) ->
    Counter#fancy_counter{
        count = Count + 1,
        timestamp = now()
    }.


get_count(Counter) ->
    Counter#fancy_counter.count.
