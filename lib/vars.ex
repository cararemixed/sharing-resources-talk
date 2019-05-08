defmodule Vars do
  def example(message, state)

  def example(:nop, state) do
    state
  end

  def example(message, state) do
    state = incr_count(state)
    some_value = consume(message, state)
    ^some_value = consume(message, state)
    {:ok, some_value, state}
  end

  def consume(_, _state) do
    42
  end

  def incr_count(state) do
    # There are many ways to do this update...
    # here is one:
    %{state | count: state[:count] + 1}
  end
end
