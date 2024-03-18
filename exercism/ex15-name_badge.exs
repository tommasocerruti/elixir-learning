defmodule NameBadge do
  def print(id, name, department) do
    dep = if department, do: String.upcase(department), else: "OWNER"

    if id do
      "[#{id}] - #{name} - #{dep}"
    else
      "#{name} - #{dep}"
    end
  end
end
