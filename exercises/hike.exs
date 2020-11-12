defmodule Hike do
  @moduledoc """
  Given a hike, how many valleys did the hiker pass through
  
  All hikes start a sea level; U is +1; D is -1
  """
  
  @doc """
  Processes valleys count given a hike
  
  Returns `{:ok, integer}` : `{:error, binary}`
  """
  def run(path) when is_binary(path) do
    accumulator = %{
      index: 0,
      valley: false,
      count: 0
    }

    %{count: count} = 
      Enum.reduce(1..String.length(path), accumulator, fn n, acc ->
        direction = String.at(path, n - 1)
        
        acc = 
          case direction do
            "U" ->
              acc = Map.update(acc, :index, 0, &(&1 + 1))

              if acc[:valley] && acc[:index] == 0 do
                IO.puts("\nIncrementing count...")
                Map.merge(acc, %{valley: false, count: acc[:count] + 1})
              else
                acc
              end

            "D" ->
              acc = Map.update(acc, :index, 0, &(&1 - 1))

              if !acc[:value] && acc[:index] <= -2 do
                Map.merge(acc, %{valley: true})
              else
                acc
              end

            _ ->
              acc
          end
        
        IO.puts("Going #{direction} @ index #{acc[:index]}")
        acc
      end)
      
    {:ok, count}
  end
  
  def call(_path), do: {:error, "Path must be a string"}
end

Hike.run("UDDDUDUUUDDDDUUUU") |> IO.inspect()
