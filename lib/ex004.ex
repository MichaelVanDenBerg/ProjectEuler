defmodule ProjectEuler.Four do
  @moduledoc """
  Largest palindrome product
  A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
  Find the largest palindrome made from the product of two 3-digit numbers.
  https://projecteuler.net/problem=4
  """

  def run(digits \\ 3) do
    number = generate_number(digits)
    find_palindrome(number, number, %{a: number, b: number, result: 0})
  end

  defp generate_number(digits) do
    String.to_integer(Enum.reduce(1..digits, "", fn _n, string -> "9" <> string end))
  end

  defp find_palindrome(a, b, map) do
    result = a * b
    reversed = result |> Integer.to_string() |> String.reverse() |> String.to_integer()

    cond do
      a === 0 && b === 0 ->
        "The answer is: #{map.result} (#{map.a} * #{map.b})"

      result === reversed && result > map.result ->
        find_palindrome(a, b - 1, %{a: a, b: b, result: result})

      b !== 0 ->
        find_palindrome(a, b - 1, map)

      true ->
        find_palindrome(a - 1, a - 1, map)
    end
  end
end

# The answer is: 906609 (993 * 913)
