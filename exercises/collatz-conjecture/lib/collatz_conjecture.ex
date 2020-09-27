defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """
  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(input) do
    calc(input, 0)
  end

  def calc(input, number) when is_integer(input) do
    cond do
      input <= 0 -> raise FunctionClauseError
      input == 1 -> number
      rem(input, 2) == 1 -> calc(input*3+1, number+1)
      rem(input, 2) == 0 -> calc(div(input, 2), number+1)
    end
  end
  def calc(_input, _number) do
    raise FunctionClauseError
  end
end
