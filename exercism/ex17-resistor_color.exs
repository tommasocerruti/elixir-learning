defmodule ResistorColor do
  @moduledoc """
  Return the value of a color band
  """
  @spec code(atom) :: integer()
  def code(color) do
    cond do
      color == :black -> 0
      color == :brown -> 1
      color == :red -> 2
      color == :orange -> 3
      color == :yellow -> 4
      color == :green -> 5
      color == :blue -> 6
      color == :violet -> 7
      color == :grey -> 8
      color == :white -> 9
    end
  end
end
