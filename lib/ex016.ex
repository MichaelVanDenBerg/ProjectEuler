defmodule ProjectEuler.Sixteen do
  @moduledoc """
  Power digit sum

  2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

  What is the sum of the digits of the number 2^1000?
  """

  def run(n \\ 1000) do
    Integer.pow(2, n)
    |> Integer.digits()
    |> Enum.sum()
  end
end
