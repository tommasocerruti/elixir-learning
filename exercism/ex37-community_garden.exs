defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(_opts \\ []), do: Agent.start_link(fn -> %{plots: %{}, next_id: 1} end)

  def list_registrations(pid), do: Agent.get(pid, &Map.values(&1.plots))

  def register(pid, register_to) do
    Agent.get_and_update(pid, fn db ->
      plot = new_plot(db.next_id, register_to)
      new_db =
        db
        |> put_in([:plots, db.next_id], plot)
        |> Map.put(:next_id, db.next_id + 1)
      {plot, new_db}
    end)
  end

  def release(pid, plot_id), do: Agent.update(pid, &%{&1 | plots: Map.delete(&1.plots, plot_id)})

  def get_registration(pid, plot_id), do: Agent.get(pid, &Map.get(&1.plots, plot_id, {:not_found, "plot is unregistered"}))

  defp new_plot(plot_id, register_to), do: %Plot{plot_id: plot_id, registered_to: register_to}
end
