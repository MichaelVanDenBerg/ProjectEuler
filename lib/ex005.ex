defmodule ProjectEuler.Five do
  @moduledoc """
  Smallest multiple
  2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
  What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
  https://projecteuler.net/problem=5
  """

  def run(a \\ 1, b \\ 20) do
    solve(a, b, b * b, a)
  end

  defp solve(a, b, c, d) do
    cond do
      rem(c, d) === 0 && d === b ->
        "The answer for numbers #{a} to #{b} is: #{c}!"

      rem(c, d) === 0 && d !== b ->
        solve(a, b, c, d + 1)

      true ->
        solve(a, b, c + b, a)
    end
  end
end

# "The answer for numbers 1 to 20 is: 232792560!"
