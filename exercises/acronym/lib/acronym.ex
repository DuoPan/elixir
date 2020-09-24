defmodule Acronym do
  @doc """
  Generate an acronym from a string.
  "This is a string" => "TIAS"
  """
  @spec abbreviate(String.t()) :: String.t()
  def abbreviate(string) do
    upper = String.upcase(string)
    a_list = String.split(upper, [" ", "-", "_"])
    b_list = Enum.map(a_list, fn x -> String.at(x, 0) end)
    Enum.join(b_list, "")
  end

  def example(string) do
    Regex.scan(~r/[A-Z]+[a-z']*|[a-z][a-z']*/, string)
  end
end
