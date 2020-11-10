defmodule Merchant do
  @moduledoc """
  Calculates the number of pairs in a list
  """
  
  def pairs(num_socks, sock_colors) do
    if valid_args?(num_socks, sock_colors) do
      {:ok, detect_pairs_count(sock_colors)}
    else  
      {:error, "Invalid input"}
    end
  end
  
  defp valid_args?(num_socks, sock_colors) do
    num_socks == length(sock_colors)
  end
  
  defp detect_pairs_count(colors) do
    {_, count} =
      Enum.reduce(colors, {colors, 0}, fn color, {arr, i} ->
        arr = List.delete(arr, color)
        
        if color in arr do
          {List.delete(arr, color), i + 1}
        else
          {arr, i}
        end
      end)
    
    count
  end
end

# result = Merchant.pairs(9, [10, 20, 20, 10, 10, 30, 50, 10, 20])
result = Merchant.pairs(5, [1, 1, 1, 3, 3])
IO.inspect(result)
