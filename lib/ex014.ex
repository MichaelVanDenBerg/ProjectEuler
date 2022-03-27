defmodule ProjectEuler.Fourteen do
  @moduledoc """
  Longest Collatz sequence

  The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:

  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
  It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms. Although it has not been proved yet (Collatz Problem), it is thought that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.
  """

  def run(limit \\ 999_999) do
    Enum.reduce(1..limit, {}, fn x, acc -> compare_collatz_length(x, acc) end)
  end

  defp compare_collatz_length(x, {}), do: {x, 0}

  defp compare_collatz_length(x, {stored_number, stored_steps}) do
    {_, steps} = calc_collatz_length({x, 0})

    if steps > stored_steps do
      {x, steps}
    else
      {stored_number, stored_steps}
    end
  end

  defp calc_collatz_length({1, steps}), do: {1, steps}

  defp calc_collatz_length({n, steps}) when rem(n, 2) === 0 do
    calc_collatz_length({div(n, 2), steps + 1})
  end

  defp calc_collatz_length({n, steps}) do
    calc_collatz_length({3 * n + 1, steps + 1})
  end
end
