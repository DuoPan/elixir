defmodule Binary do
  @doc """
  Convert a string containing a binary number to an integer.

  On errors returns 0.
  """
  @spec to_decimal(String.t()) :: non_neg_integer
  def to_decimal(string) do
    list = string
    |> String.graphemes()

    legal = list
    |> Enum.all?(fn x -> x == "0" || x == "1" end)

    if legal do
      list
    |> Enum.map(fn x -> String.to_integer(x) end)
      |> Enum.reverse()
      |> Enum.with_index()
      |> Enum.map(fn ({value, index}) -> :math.pow(2, index)*value end)
      |> Enum.sum()
      |> trunc()
    else
      0
    end
  end
end
