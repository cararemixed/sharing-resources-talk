-module(basic).

-export([answer/0, greet/1, sum/1]).

answer() -> {ok, 42}.

greet(Name) when is_binary(Name) ->
    io:format(<<"Hello ", Name/binary, "\n">>);
greet(Name) when is_list(Name) ->
    io:format("Hello " ++ Name ++ "\n").

%% Sum numbers in a list
sum(List) ->
    sum(List, 0). % assume empty list = 0

sum([], Acc) ->
    Acc;
sum([N | Rest], Acc) ->
    sum(Rest, N + Acc).
