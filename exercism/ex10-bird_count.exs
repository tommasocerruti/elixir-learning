defmodule BirdCount do

  def today([]), do: nil
  def today(list) do
    [first | _rest] = list
    first
  end

  def increment_day_count([]), do: [1]
  def increment_day_count([first | rest]), do: [first+1 | rest]

  def has_day_without_birds?([]), do: false
  def has_day_without_birds?([first | _rest])  when first==0, do: true
  def has_day_without_birds?([_first | rest]), do: has_day_without_birds?(rest)

  def total([]), do: 0
  def total([first | rest]), do: first+total(rest)

  def busy_days([]), do: 0
  def busy_days([first | rest]) do
    cond do
      (first>=5) -> 1+busy_days(rest)
      true -> busy_days(rest)
    end
  end

end
