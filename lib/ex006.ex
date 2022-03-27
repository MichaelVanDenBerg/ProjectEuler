defmodule ProjectEuler.Six do
  @moduledoc """
  Sum square difference
  The sum of the squares of the first ten natural numbers is,
  12+22+...+102=385
  1^2 + 2^2 + ... + 10^2 = 385
  The square of the sum of the first ten natural numbers is,
  (1+2+...+10)^2=55^2=3025
  Hence the difference between the sum of the squares of the first ten natural numbers and the square of the sum is 3025−385=2640
  3025 − 385 = 2640.
  Find the difference between the sum of the squares of the first one hundred natural numbers and the square of the sum.
  """

  def run(a \\ 1, b \\ 100) do
    find_sum_of_squares(a, b)
    |> find_square_of_sum(a, b)
    |> print_result()
  end

  defp find_sum_of_squares(a, b) do
    total =
      Enum.map(a..b, fn x -> :math.pow(x, 2) end)
      |> Enum.sum()
      |> trunc

    %{sum_of_squares: total}
  end

  defp find_square_of_sum(map, a, b) do
    total =
      Enum.sum(a..b)
      |> :math.pow(2)
      |> trunc

    Map.put(map, :square_of_sum, total)
  end

  defp print_result(map) do
    "The answer is: #{map.square_of_sum} - #{map.sum_of_squares} = #{map.square_of_sum - map.sum_of_squares}."
  end
end

# "The answer is: 25502500 - 338350 = 25164150."
