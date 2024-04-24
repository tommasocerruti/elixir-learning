defmodule Chessboard do

  def rank_range, do: 1..8
  def file_range, do: ?A..?H
  def ranks, do: rank_range() |> Enum.to_list
  def files, do: file_range() |> Enum.map(fn x -> <<x>> end)

end
