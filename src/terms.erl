-module(terms).

-export([
    sizes/0
]).

-export([
    literal/0,
    computed/0,
    updated/0,
    persistent/0
]).

-define(sz(X), erts_debug:size_shared(X)).
-define(KEY, {?MODULE, map}).

sizes() ->
    [
        {literal, ?sz(literal())},
        {computed, ?sz(computed())},
        {updated, ?sz(updated())},
        {persistent, ?sz(persistent())}
    ].


literal() ->
    #{a => 1, b => 2, c => 3, d => 4}.


computed() ->
    maps:from_list([{a, 1}, {b, 2}, {c, 3}, {d, 4}]).


updated() ->
    % {{a, b, c, d}, {1, 2, 3, 4}}
    Map = literal(),
    Map#{a := 2, b := 3, c := 4, d := 5}.


persistent() ->
    Map = computed(),
    persistent_term:put(?KEY, Map),
    persistent_term:get(?KEY).
