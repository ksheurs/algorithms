defmodule TrainTickets do
    @moduledoc """
    Given a stack of train tickets (each referencing a source station and destination 
    station), link the trips together and output the full trip in order.

    Example:
      input: [
        ["BOS", "ALB"],
        ["BUF", "NIA"],
        ["ALB", "SYR"],
        ["NIA", "TOR"],
        ["NYC", "PRO"],
        ["PRO", "BOS"],
        ["ROC", "BUF"],
        ["SYR", "ROC"]
      ]

      output: ["NYC", "PRO", "BOS", "ALB", "SYR", "ROC", "BUF", "NIA", "TOR"]
    """

    @doc """
    Accepts a list of tickets (trip tuples) and finds the ordered trip
    """
    def process(tickets \\ []) do
      location_to_index_map = build_lookup_map(tickets)
      
      tickets
      |> find_initial_trip()
      |> link_tickets(tickets, location_to_index_map)
    end

    defp build_lookup_map(tickets) do
      tickets
      |> Enum.with_index()
      |> Enum.reduce(%{}, fn {{source, _destination}, index}, acc ->
        Map.merge(acc, %{source => index})
      end)
    end

    defp find_initial_trip(trips) do
      trip =
        Enum.find(trips, fn {source, _destination} ->
          not Enum.any?(trips, fn {_, destination} -> source == destination end)
        end)

      Tuple.to_list(trip)
    end

    defp link_tickets(trips, tickets, location_to_index_map) do
      Enum.reduce(tickets, trips, fn {_, _}, acc ->
        source = List.last(acc)
        
        case location_to_index_map[source] do
          nil ->
            acc
          
          index -> 
            {_, destination} = Enum.at(tickets, index)
            acc ++ [destination]
        end
      end)
    end
end

tickets = [
  {"BOS", "ALB"},
  {"BUF", "NIA"},
  {"ALB", "SYR"},
  {"NIA", "TOR"},
  {"NYC", "PRO"},
  {"PRO", "BOS"},
  {"ROC", "BUF"},
  {"SYR", "ROC"}
]

tickets |> TrainTickets.process() |> IO.inspect()
