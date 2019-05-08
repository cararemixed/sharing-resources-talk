-module(literals).

-export([
    numbers/0,
    tuples/0,
    lists/0,
    binaries/0,
    funs/0
]).


numbers() ->
    [
        -1, 0, 1,
        1000000,
        1.0, 3.14159
        % nan, infinity are atoms not numbers!
    ].

tuples() ->
    [
        {ok, "The answer is 42"},
        {},
        {1},
        element(1, {a,b,c,d}) % returns a
    ].

lists() ->
    [
        [1, 2, 3],
        [1 | [2 | [3 | []]]],
        "abc",
        [$a, $b, $c],
        "abc" ++ "xyz",
        [1, 2, 3] -- [2],
        [{timeout, 1000}, {keyword, list}]
    ].

binaries() ->
    A = <<"hello ">>,
    B = <<"world">>,
    [
        <<>>,
        <<"hello world">>,
        <<A/binary, B/binary>>,
        <<1, 2, 3>>,
        <<42:128>>
    ].

funs() ->
    [
        fun () -> 2 + 2 end,
        fun (X) -> X + 1 end,
        fun
            SumList([]) -> 0;
            SumList([H | T]) -> H + SumList(T)
        end,
        fun funs/0,
        fun erlang:exit/2
    ].
