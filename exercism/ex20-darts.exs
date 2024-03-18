defmodule Darts do
  @type position :: {number, number}

  @doc """
  Calculate the score of a single dart hitting a target
  """
  @spec score(position) :: integer
  def score({x, y}), do: eval(:math.sqrt(x**2 + y**2))

  defp eval (val) do
    cond do
      val <= 1 -> 10
      val <= 5 -> 5
      val <= 10 -> 1
      true -> 0
    end
  end
end
