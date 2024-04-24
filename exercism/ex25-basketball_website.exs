defmodule BasketballWebsite do
  def extract_from_path(data, path), do: rec_extract(data, String.split(path, "."))

  defp rec_extract(data, []), do: data

  defp rec_extract(data, [head | tail]), do: rec_extract(data[head], tail)

  def get_in_path(data, path), do: Kernel.get_in(data, String.split(path, "."))

end
