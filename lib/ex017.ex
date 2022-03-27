defmodule ProjectEuler.Seventeen do
  @moduledoc """
  Number letter counts

  If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

  If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?

  NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters. The use of "and" when writing out numbers is in compliance with British usage.
  """

  def run(n \\ 1000) do
    Enum.reduce(1..n, 0, fn x, acc -> acc + count_letters(x) end)
  end

  def count_letters(n) do
    case Integer.digits(n) do
      # e.g. One Thousand
      [1, 0, 0, 0] ->
        get_word_weight(1) + get_word_weight(1000)

      # e.g. One Hundred
      [a, 0, 0] ->
        get_word_weight(a) + get_word_weight(100)

      # e.g. One Hundred and Twenty
      [a, b, 0] ->
        get_word_weight(a) + get_word_weight(100) + get_word_weight("and") +
          get_word_weight(b * 10)

      # e.g. One Hundred and Fifteen
      [a, 1, c] ->
        t = String.to_integer("1" <> to_string(c))
        get_word_weight(a) + get_word_weight(100) + get_word_weight("and") + get_word_weight(t)

      # e.g. One Hundred and Twenty One
      [a, b, c] ->
        get_word_weight(a) + get_word_weight(100) + get_word_weight("and") +
          get_word_weight(b * 10) + get_word_weight(c)

      # e.g. Nineteen
      [1, c] ->
        t = String.to_integer("1" <> to_string(c))
        get_word_weight(t)

      # e.g. Fifty
      [b, 0] ->
        get_word_weight(b * 10)

      # e.g. Fifty Four
      [b, c] ->
        get_word_weight(b * 10) + get_word_weight(c)

      # e.g. One
      [c] ->
        get_word_weight(c)
    end
  end

  # Assign a weight to each word based on
  # the number of letters in the word.
  defp get_word_weight(n) do
    [
      %{value: 0, weight: 0},
      %{value: 1, weight: 3},
      %{value: 2, weight: 3},
      %{value: 3, weight: 5},
      %{value: 4, weight: 4},
      %{value: 5, weight: 4},
      %{value: 6, weight: 3},
      %{value: 7, weight: 5},
      %{value: 8, weight: 5},
      %{value: 9, weight: 4},
      %{value: 10, weight: 3},
      %{value: 11, weight: 6},
      %{value: 12, weight: 6},
      %{value: 13, weight: 8},
      %{value: 14, weight: 8},
      %{value: 15, weight: 7},
      %{value: 16, weight: 7},
      %{value: 17, weight: 9},
      %{value: 18, weight: 8},
      %{value: 19, weight: 8},
      %{value: 20, weight: 6},
      %{value: 30, weight: 6},
      %{value: 40, weight: 5},
      %{value: 50, weight: 5},
      %{value: 60, weight: 5},
      %{value: 70, weight: 7},
      %{value: 80, weight: 6},
      %{value: 90, weight: 6},
      %{value: 100, weight: 7},
      %{value: 1000, weight: 8},
      %{value: "and", weight: 3}
    ]
    |> Enum.find(fn x -> x.value === n end)
    |> Map.get(:weight)
  end
end
