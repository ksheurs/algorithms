defmodule Rotator do
  @moduledoc """
  Rotates an array by `n` number of left rotations
  
  Example: Rotating [1, 2, 3, 4, 5] by 2 == [3, 4, 5, 1, 2]
  """
  
  @doc """
  Inputs are the source array and `n` number of rotations
  
  Returns `{:ok, array}` | `{:error, string}`
  """
  def run([_head | _] = source, n) when is_integer(n) do
    # 1. reduce over n spread
    # 2. insert_at / delete_at on accumulated source
    # 3. look to refactor and optimize
    
    output = 
      Enum.reduce(0..n - 1, source, fn _i, acc ->
        left_rotate_by_one_advanced(acc)
      end)
    
    {:ok, output}
  end
  
  def run(_source, _n), do: {:error, "Invalid arguments"}
  
  # defp left_rotate_by_one_basic(array) do
  #   array = List.insert_at(array, length(array), Enum.at(array, 0))
  #   array = List.delete_at(array, 0)
  #   array
  # end
  
  defp left_rotate_by_one_advanced(source) do
    [head | _tail] = source
    
    output = 
      Enum.reduce(1..length(source) - 1, [], fn i, acc ->
        acc ++ [Enum.at(source, i)]
      end)
    
    output ++ [head]
  end
end

Rotator.run([1, 2, 3, 4, 5], 2) |> IO.inspect()
