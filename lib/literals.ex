defmodule Literals do
  def numbers do
    [
      -1,
      0,
      1,
      1_000_000,
      1.0,
      3.14159
      # nan, infinity are atoms not numbers!
    ]
  end

  def tuples do
    [
      {:ok, 'The answer is 42'},
      {},
      {1},
      # returns :b
      elem({:a, :b, :c, :d}, 1)
    ]
  end

  def lists do
    [
      [1, 2, 3],
      [1 | [2 | [3 | []]]],
      'abc',
      [?a, ?b, ?c],
      'abc' ++ 'xyz',
      [1, 2, 3] -- [2],
      [{:timeout, 1000}, keyword: :list]
    ]
  end

  def binaries do
    a = "hello "
    b = "world"

    [
      "",
      "hello world",
      a <> b,
      <<1, 2, 3>>,
      <<42::128>>
    ]
  end

  def funs do
    [
      fn -> 2 + 2 end,
      &(&1 + 1),
      fn list ->
        sum_list = fn
          [], _ -> 0
          [h | t], sum_list -> h + sum_list.(t)
        end

        sum_list.(list, sum_list)
      end,
      &funs/0,
      &:erlang.exit/2
    ]
  end
end
