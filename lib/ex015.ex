defmodule ProjectEuler.Fifteen do
  @moduledoc """
  Lattice paths

  Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down, there are exactly 6 routes to the bottom right corner.

  How many such routes are there through a 20×20 grid?

  https://projecteuler.net/problem=15
  """
  def run(n \\ 20) do
    trunc(factorial(2 * n) / (factorial(n) * factorial(n)))
  end

  def factorial(0), do: 1

  def factorial(n) when n > 0 do
    Enum.reduce(1..n, fn x, fac -> fac * x end)
  end
end

# Notes:
# https://stemhash.com/counting-lattice-paths/
# https://en.wikipedia.org/wiki/Binomial_coefficient
