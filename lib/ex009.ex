defmodule ProjectEuler.Nine do
  @moduledoc """
  Special Pythagorean triplet
  A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,

  a2 + b2 = c2
  For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

  There exists exactly one Pythagorean triplet for which a + b + c = 1000.
  Find the product abc.
  """

  def run(n \\ 1000) do
    solve(1, 1, 1, n)
  end

  defp solve(a, b, c, n) when a + b + c === n and a * a + b * b == c * c do
    "The answer is: #{a} x #{b} x #{c} = #{a * b * c}."
  end

  defp solve(a, b, c, n) when a < b do
    solve(a + 1, b, c, n)
  end

  defp solve(_, b, c, n) when b < c do
    solve(1, b + 1, c, n)
  end

  defp solve(a, _, c, n) when c < n do
    solve(a, 1, c + 1, n)
  end
end
