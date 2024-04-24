defmodule NeedForSpeed do
  import IO, only: [puts: 1]
  import IO.ANSI, except: [color: 1]

  alias NeedForSpeed.Race, as: Race
  alias NeedForSpeed.RemoteControlCar, as: Car

  def print_race(%Race{} = race) do
    puts("""
    🏁 #{race.title} 🏁
    Status: #{Race.display_status(race)}
    Distance: #{Race.display_distance(race)}

    Contestants:
    """)

    race.cars
    |> Enum.sort_by(&(-1 * &1.distance_driven_in_meters))
    |> Enum.with_index()
    |> Enum.each(fn {car, index} -> print_car(car, index + 1) end)
  end

  defp print_car(%Car{} = car, index) do
    color = color(car)

    puts("""
      #{index}. #{color}#{car.nickname}#{default_color()}
      Distance: #{Car.display_distance(car)}
      Battery: #{Car.display_battery(car)}
    """)
  end

  defp color(%Car{} = car) do
    case car.color do
      :red -> red()
      :blue -> cyan()
      :green -> green()
    end
  end
end

defmodule NeedForSpeed.Race do
  defstruct [
    :title,
    :total_distance_in_meters,
    cars: []
  ]

  def display_status(%NeedForSpeed.Race{} = race) do
    cond do
      Enum.any?(race.cars, &(&1.distance_driven_in_meters >= race.total_distance_in_meters)) ->
        "Finished"

      Enum.any?(race.cars, &(&1.distance_driven_in_meters > 0)) ->
        "In Progress"

      true ->
        "Not Started"
    end
  end

  def display_distance(%NeedForSpeed.Race{total_distance_in_meters: d}) do
    "#{d} meters"
  end
end

defmodule NeedForSpeed.RemoteControlCar do
  defstruct [
    :nickname,
    :color,
    battery_percentage: 100,
    distance_driven_in_meters: 0
  ]

  def new(color, nickname) when color in [:red, :blue, :green] do
    %NeedForSpeed.RemoteControlCar{nickname: nickname, color: color}
  end

  def display_distance(%NeedForSpeed.RemoteControlCar{distance_driven_in_meters: d}) do
    "#{d} meters"
  end

  def display_battery(%NeedForSpeed.RemoteControlCar{battery_percentage: 0}) do
    "Battery empty"
  end

  def display_battery(%NeedForSpeed.RemoteControlCar{battery_percentage: b}) do
    "Battery at #{b}%"
  end
end
