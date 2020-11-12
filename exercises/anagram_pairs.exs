defmodule AnagramPairs do
  @moduledoc """
  Find the number of unordered anagram pairs in a string
  
  Example: "abba"
    a <-> a
    b <-> b
    ab <-> ba
    abb <-> bba
  """
  
  @doc """
  Input: string
  
  1. get all substrings for string
  2. for each substring, remove from array + check for char existences
  3. calc total
  
  Return: integer
  """
  def process(string) do
    substrings = string |> substrings()
    
    Enum.reduce(0..length(substrings) - 1, 0, fn i, count ->
      count + total_anagrams(i, substrings)
    end)
  end
  
  defp substrings(string) do
    length = String.length(string)
    
    Enum.reduce(0..length - 1, [], fn i, acc ->
      Enum.reduce(i..length - 1, acc, fn j, acc ->
        acc ++ [String.slice(string, i..j)]
      end)
    end)
  end
  
  defp total_anagrams(index, substrings) do
    string = Enum.at(substrings, index)
    remaining = Enum.drop(substrings, index+1)

    Enum.reduce(remaining, 0, fn s, acc ->
      if String.length(s) == String.length(string) && is_anagram?(s, string) do
        acc + 1
      else
        acc
      end
    end)
  end
  
  defp is_anagram?(string1, string2) do
    hash =
      Enum.reduce(0..String.length(string1) - 1, %{}, fn i, acc ->
        char = String.at(string1, i)
        Map.update(acc, char, 1, &(&1 + 1))
      end)
    
    accumulator = {hash, true}

    {_, result} =
      Enum.reduce(0..String.length(string2) - 1, accumulator, fn i, {hash, bool} ->
        char = String.at(string2, i)

        if hash[char] && hash[char] > 0 && bool do
          {Map.update(hash, char, 1, &(&1 - 1)), true}
        else
          {hash, false}
        end
      end)
    
    result
  end
end

AnagramPairs.process("abba") |> IO.inspect()
