defmodule TwoSum do
  @moduledoc """
  Given an array of integers `nums` and an integer `target`,
  return the indices of the two numbers that add up to `target`.
  """

  def run(nums, target) do
    max_index = length(nums) - 1

    map = 
      Enum.reduce(0..max_index, Map.new(), fn i, acc ->
        Map.put(acc, Enum.at(nums, i), i)
      end)
      
    Enum.reduce_while(0..max_index, [], fn i, acc ->
      key = target - Enum.at(nums, i)

      if Map.has_key?(map, key) do
        {:halt, [i, Map.get(map, key)]}
      else
        {:cont, acc}
      end
    end)
  end
end

TwoSum.run([2, 7, 11, 15], 18) |> IO.inspect()
