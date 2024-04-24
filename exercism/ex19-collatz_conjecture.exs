defmodule CollatzConjecture do
  @doc """
  calc/1 takes an integer and returns the number of steps required to get the
  number to 1 when following the rules:
    - if number is odd, multiply with 3 and add 1
    - if number is even, divide by 2
  """

  @spec calc(input :: pos_integer()) :: non_neg_integer()
  def calc(num) when num>0 and is_integer(num), do: calcp(0,num)

  @spec calcp(input :: non_neg_integer(), input :: pos_integer()) :: non_neg_integer()
  defp calcp(count, 1), do: count
  defp calcp(count, num) when rem(num,2) == 0, do: calcp(count+1, div(num,2))
  defp calcp(count, num), do: calcp(count+1, 3*num + 1)

end
