defmodule Bob do
  def hey(input) do
    input = String.trim(input)
    containQuestionMark = input |> String.graphemes() |> Enum.at(-1) == "?"
    shout = input =~ ~r(^[^a-z]*$)
    onlyNumbers = input =~ ~r(^[^a-zA-Z]*$)
    cond do
      String.trim(input) == "" -> "Fine. Be that way!"
      onlyNumbers && containQuestionMark -> "Sure."
      onlyNumbers -> "Whatever."
      !containQuestionMark && shout -> "Whoa, chill out!"
      containQuestionMark && shout  -> "Calm down, I know what I'm doing!"
      containQuestionMark -> "Sure."
      input -> "Whatever."
    end
  end
end
# Enum.all?(String.graphemes(input), fn x -> )
