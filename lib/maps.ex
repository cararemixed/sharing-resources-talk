defmodule MapsExample do
  def new_map do
    %{answer: 42}
  end

  def update_value(map, value) do
    %{map | answer: value}
  end

  def add_key(map) do
    map |> Map.put(:other, :value)
  end
end
