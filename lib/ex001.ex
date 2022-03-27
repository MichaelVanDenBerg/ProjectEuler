defmodule ProjectEuler.One do
  @moduledoc """
  Multiples of 3 and 5
  If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9. The sum of these multiples is 23.
  Find the sum of all the multiples of 3 or 5 below 1000.
  https://projecteuler.net/problem=1
  """

  def run(range \\ 999, a \\ 3, b \\ 5) do
    solve(range, a, b, 0)
  end

  defp solve(range, _a, _b, sum) when range <= 1 do
    IO.puts(sum)
  end

  defp solve(range, a, b, sum) when rem(range, a) === 0 do
    solve(range - 1, a, b, sum + range)
  end

  defp solve(range, a, b, sum) when rem(range, b) === 0 do
    solve(range - 1, a, b, sum + range)
  end

  defp solve(range, a, b, sum) do
    solve(range - 1, a, b, sum)
  end
end

# The answer is: 233168.
