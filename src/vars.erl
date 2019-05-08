-module(vars).

-export([example/2]).


example(nop, State) ->
    State;
example(Message, State0) ->
    State = incr_count(State0),
    SomeValue = consume(Message, State),
    SomeValue = consume(Message, State),
    {ok, SomeValue, State}.


consume(_, _State) ->
    42.


incr_count(#{count := C} = State) ->
    State#{count := C + 1}.
