defmodule Anagram do
  @doc """
  Returns all candidates that are anagrams of, but not equal to, 'base'.
  """
  @spec match(String.t(), [String.t()]) :: [String.t()]
  def match(base, candidates) do
    Enum.filter(candidates, fn x -> ma(x, base) end)
  end

  def ma(a, b) do 
    x = a
    |> String.downcase()
    |> String.to_charlist()

    y = b
    |> String.downcase()
    |> String.to_charlist()

    if x == y do
      false
    else
      Enum.sort(x) == Enum.sort(y) 
    end
  end
end
