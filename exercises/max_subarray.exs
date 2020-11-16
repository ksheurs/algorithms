defmodule MaxSubarray do
  @moduledoc """
  Given an integer array `nums`, find the contiguous subarray 
  (containing at least one number) which has the largest sum 
  and return its `{sum, start_index, end_index}`.

  Input: nums = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
  Output: {6, 3, 6}
  Explanation: [4, -1, 2, 1] has the largest sum = 6.
  """

  def call(nums) do
    current_max = Enum.at(nums, 0)
    max = current_max
    start_index = 0
    end_index = 0
 
    acc = {current_max, max, start_index, end_index}

    {_, max, start_index, end_index} = 
      Enum.reduce(1..length(nums) - 1, acc, fn i, {current_max, max, start_index, end_index} ->
        value_at_index = Enum.at(nums, i)

        current_max = max(value_at_index, current_max + value_at_index)
        max = max(current_max, max)

        start_index = if current_max == value_at_index and current_max >= max, do: i, else: start_index
        end_index = if max <= current_max, do: i, else: end_index

        {current_max, max, start_index, end_index}
      end)

    {max, start_index, end_index}
  end
end

MaxSubarray.call([-2, 1, -3, 4, -1, 2, 1, -5, 4]) |> IO.inspect()
