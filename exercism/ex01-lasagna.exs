defmodule Lasagna do

  def expected_minutes_in_oven, do: 40

  def remaining_minutes_in_oven(t) do
    Lasagna.expected_minutes_in_oven - t
  end

  def preparation_time_in_minutes(l), do: l*2

  def total_time_in_minutes(l,t) do
    Lasagna.preparation_time_in_minutes(l)+t
  end

  def alarm, do: "Ding!"

end

# to print/debug
IO.puts Lasagna.preparation_time_in_minutes(3)
