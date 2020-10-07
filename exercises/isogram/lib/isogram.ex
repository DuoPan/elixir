defmodule Isogram do
  @doc """
  Determines if a word or sentence is an isogram
  isogram: no letters occurs more than once.
  """
  @spec isogram?(String.t()) :: boolean
  def isogram?(sentence) do
    list = sentence
    |> String.graphemes()
    |> Enum.filter(fn x -> x != "-" && x != " " end)

    length(Enum.uniq(list)) == length(list)
  end
end
