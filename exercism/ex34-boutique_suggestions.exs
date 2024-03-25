defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    max_price = Keyword.get(options, :maximum_price, 100.0)
    for top <- tops,
        bottom <- bottoms,
        top.base_color != bottom.base_color,
        (top.price + bottom.price) <= max_price do
      {top, bottom}
    end
  end
end
