defmodule Basic do
  def answer, do: {:ok, 42}

  def greet(name)

  def greet(name) when is_binary(name) do
    IO.puts("Hello " <> name)
  end

  def greet(name) when is_list(name) do
    IO.puts('Hello' ++ name)
  end

  # Sum numbers in a list
  def sum(list, acc \\ 0)

  def sum([], acc) do
    acc
  end

  def sum([n | rest], acc) do
    sum(rest, n + acc)
  end
end
