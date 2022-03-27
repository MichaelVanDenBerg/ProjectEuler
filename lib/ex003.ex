defmodule ProjectEuler.Three do
  @moduledoc """
  Largest prime factor
  The prime factors of 13195 are 5, 7, 13 and 29.
  What is the largest prime factor of the number 600851475143 ?
  https://projecteuler.net/problem=3
  """

  def run(number \\ 600_851_475_143) do
    number
    |> :math.sqrt()
    |> trunc()
    |> solve(number)
  end

  defp solve(x, number) when rem(number, x) === 0 do
    if is_prime?(x) do
      IO.puts("The answer is: #{x}")
    else
      solve(x - 1, number)
    end
  end

  defp solve(x, number) when rem(x, 2) === 0 do
    solve(x - 1, number)
  end

  defp solve(x, number) do
    solve(x - 2, number)
  end

  defp is_prime?(x) do
    ceiling = trunc(:math.sqrt(x))
    is_prime?(2, ceiling, x)
  end

  defp is_prime?(n, ceiling, x) when rem(x, n) === 0 and n < ceiling, do: false

  defp is_prime?(n, ceiling, x) when n < ceiling do
    is_prime?(n + 1, ceiling, x)
  end

  defp is_prime?(_n, _ceiling, _x), do: true
end

# The answer is: 6857.
