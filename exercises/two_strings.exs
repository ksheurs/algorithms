defmodule TwoStrings do
  @moduledoc """
  Given two strings, do any substrings share characters?
  
  If so: YES, else: NO
  """
  
  def evaluate(string1, string2) do
    [short, long] = strings_by_length(string1, string2)
    
    result =
      Enum.find(0..String.length(short) - 1, nil, fn i ->
        String.contains?(long, String.at(short, i))
      end)
    
    if result do
      "YES"
    else
      "NO"
    end
  end
  
  defp strings_by_length(string1, string2) do
    if String.length(string1) <= String.length(string2) do
      [string1, string2]
    else
      [string2, string1]
    end
  end
end

TwoStrings.evaluate("hello", "world") |> IO.inspect()
