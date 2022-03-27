defmodule ProjectEuler.Ten do
  @moduledoc """
  Summation of primes

  The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

  Find the sum of all the primes below two million.
  """

  def run(n \\ 2_000_000) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.take(n)
    |> Stream.filter(&is_prime?/1)
    |> Enum.to_list()
    |> Enum.sum()
    |> print_result()
  end

  defp is_prime?(x) when x in [2, 3, 5, 7, 11, 13, 17, 19, 23], do: true

  defp is_prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end

  defp print_result(x) do
    "The answer is: #{x}."
  end
end
