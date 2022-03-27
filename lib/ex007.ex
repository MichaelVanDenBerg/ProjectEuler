defmodule ProjectEuler.Seven do
  @moduledoc """
  10001st prime
  By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
  What is the 10 001st prime number?
  https://projecteuler.net/problem=7
  """

  def run(n \\ 10001) do
    Stream.iterate(0, &(&1 + 1))
    |> Stream.filter(&is_prime?/1)
    |> Stream.take(n)
    |> Enum.to_list()
    |> List.last()
    |> print_result(n)
  end

  def is_prime?(x) do
    Enum.all?(2..round(:math.sqrt(x)), fn n -> rem(x, n) != 0 end)
  end

  defp print_result(v, n) do
    "The value of #{n}th prime number is: #{v}."
  end
end

# "The value of 10001th prime number is: 104743."
