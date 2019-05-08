defmodule Structs do
  defstruct [:ref, :timestamp, :count, :extra]

  def new() do
    %Structs{
      ref: make_ref(),
      timestamp: :erlang.now(),
      count: 0
    }
  end

  def do_thing(struct) do
    %Structs{struct | count: struct.count + 1, timestamp: :erlang.now()}
  end

  def get_count(struct) do
    struct.count
  end
end
