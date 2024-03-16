defmodule HighScore do
  @zero 0

  def new(), do: Map.new()

  def add_player(scores, name, score \\ @zero), do: Map.put(scores, name, score)

  def remove_player(scores, name), do: Map.delete(scores, name)

  def reset_score(scores, name), do: Map.update(scores, name, @zero, fn _prev -> @zero end)

  def update_score(scores, name, score), do: Map.update(scores, name, score, fn prev -> prev+score end)

  def get_players(scores), do: Map.keys(scores)
end
