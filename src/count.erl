-module(count).

-export([
    ets/0,
    counters/0
]).

-record(counter, {
    name :: atom(),
    value = 0 :: integer()
}).


ets() ->
    Table = ets:new(?MODULE, [
        set, write_concurrency, {keypos, #counter.name}
    ]),
    ets:insert(Table, #counter{name = example}),
    % See docs for more elaborate variants
    % adds 2 to our counter named example:
    ets:update_counter(Table, example, {#counter.value, 2}).


counters() ->
    % could also use atomics instead of write_concurrency
    Counters = counters:new(10, [write_concurrency]),
    % Add 2 to the *first* counter
    counters:add(Counters, 1, 2).
