defmodule Username do

  def sanitize(username) do
    case username do
      [] -> ~c""
      [?ä | rest] -> ~c"ae" ++ sanitize(rest)
      [?ö | rest] -> ~c"oe" ++ sanitize(rest)
      [?ü | rest] -> ~c"ue" ++ sanitize(rest)
      [?ß | rest] -> ~c"ss" ++ sanitize(rest)
      [?_ | rest] -> ~c"_" ++ sanitize(rest)
      [char | rest] when char in ?a..?z -> [char | sanitize(rest)]
      [_ | rest] -> sanitize(rest)
    end
  end

end
