-module(macros).

-export([
    show_me/1
]).

%% Attributes show up in compiler generated
%% `module_info/0,1` functions.
-my_custom_attr(42).
% Same as:
% -my_custom_attr([42]).

-define(inspect(X), io:format("-module(~p): ~p~n", [?MODULE, X])).


show_me(Thing) ->
    ?inspect(Thing).

%% Also of note: syntax_tools (merl!)
