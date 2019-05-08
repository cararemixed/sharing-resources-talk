-module(user_default).
-export([
    c/0,
    tc/1, tv/0,
    clear/0,
    sleep/1,
    spin/1
]).

-export([
    future/1, await/1, cancel/1, run/1
]).

-include_lib("kernel/include/file.hrl").
-include_lib("stdlib/include/zip.hrl").
-include_lib("syntax_tools/include/merl.hrl").
% -include_lib("eunit/include/eunit.hrl").


-record(future, {
    pid :: pid()
}).


c() ->
    r3:do(compile).


tc(F) ->
    {T, V} = timer:tc(F),
    put('$time_value', V),
    T.


tv() ->
    get('$time_value').


clear() ->
    io:format([27, "[2J", 27, "[;H"]).


sleep(Ms) ->
    receive
    after Ms -> ok
    end.


spin(Ms) ->
    Ref = make_ref(),
    erlang:send_after(Ms, self(), Ref),
    spin_wait(Ref).


spin_wait(Ref) ->
    receive
        Ref -> ok
    after 0 ->
        spin_wait(Ref)
    end.


%% Stupid simple futures implementation

future(Fun) ->
    Shell = self(),
    Pid = spawn_link(fun () ->
        try
            Shell ! {future_resolve, self(), Fun()}
        catch
            error:Err ->
                Shell ! {future_error, self(), Err}
        end
    end),
    #future{pid = Pid}.


await(#future{pid = Pid}) ->
    receive
        {future_resolve, Pid, Value} -> Value;
        {future_error, Pid, Err} -> erlang:error(Err)
    end.


cancel(#future{pid = Pid}) ->
    %% TODO: it might be worth keeping track of
    %% pending futures in an ETS table so await
    %% doesn't hang. This is good enough for now.
    exit(Pid, kill).


run(Fun) when is_function(Fun) ->
    await(future(Fun));

run(Funs) when is_list(Funs) ->
    Futures = [future(Fun) || Fun <- Funs],
    [await(Future) || Future <- Futures].
