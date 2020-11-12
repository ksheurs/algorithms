defmodule Handlebars do
  @moduledoc """
  Implement basic Handlebars.js / Mustache parsing function.
  
  Example: 
  
    ```
    Handlebars.parse("Hello, {name}", %{name: "Kevin"})
    # Hello, Kevin
    ```
  """
  
  def parse(string, %{} = dictionary) do
    string
    |> process(dictionary)
  end
  
  defp process(string, dictionary, cont \\ true)
  
  defp process(string, dictionary, true) do
    string = 
      if String.contains?(string, "{") do
        evaluate_template_for(string, dictionary)
      else
        string
      end
  
    process(string, dictionary, String.contains?(string, "{"))
  end
  
  defp process(string, _dictionary, false) do
    string
  end
  
  defp evaluate_template_for(string, dictionary) do
    {start_index, _} = :binary.match(string, "{")
    {end_index, _} = :binary.match(string, "}")
    
    key =
      string
      |> String.slice(start_index + 1..end_index - 1)
      |> String.to_atom()
    
    value = Map.get(dictionary, key, "")
    
    head =
      Enum.reduce(0..start_index - 1, "", fn i, acc ->
        acc <> String.at(string, i)
      end)
    
    tail = 
      Enum.reduce(end_index..String.length(string) - 1, "", fn i, acc ->
        char = String.at(string, i + 1)
        
        if char != nil do
          acc <> char
        else
          acc
        end
      end)
    
    head <> value <> tail
  end
end

template = "Hello, {name}. Welcome to {place}."
dictionary = %{name: "Kevin", place: "NYC"}

template
|> Handlebars.parse(dictionary)
|> IO.inspect()
