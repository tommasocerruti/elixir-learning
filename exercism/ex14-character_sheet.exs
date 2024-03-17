defmodule RPG.CharacterSheet do

  def welcome(), do: IO.puts("Welcome! Let's fill out your character sheet together.")

  def ask_name(), do: IO.gets("What is your character's name?\n") |> String.trim

  def ask_class(), do: IO.gets("What is your character's class?\n") |> String.trim


  def ask_level(), do: IO.gets("What is your character's level?\n") |> String.trim |> String.to_integer

  def run() do
    welcome()
    name   = ask_name()
    class  = ask_class()
    level  = ask_level()
    player = %{class: class, level: level, name: name}
    IO.inspect(player, label: "Your character")
  end

end
