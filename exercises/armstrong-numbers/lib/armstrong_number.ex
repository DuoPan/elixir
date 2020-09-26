defmodule ArmstrongNumber do
  @moduledoc """
  Provides a way to validate whether or not a number is an Armstrong number
  """

  @spec valid?(integer) :: boolean
  def valid?(number) when number < 0 do
    false
  end
  def valid?(number) when number < 2 do
    true
  end
  def valid?(number) do
    list = number
    |> Integer.to_string()
    |> String.graphemes()

    times = length(list)

    list
    |> Enum.map(fn x ->  :math.pow(String.to_integer(x), times) end)
    |> Enum.sum()
    == number
  end
end
