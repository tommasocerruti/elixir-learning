defmodule TakeANumber do

  def start do
    spawn_link(fn -> loop(0) end)
  end

  defp loop(state) do
    receive do
      {:report_state, sender_pid} ->
        send(sender_pid, state)
        loop(state)

      {:take_a_number, sender_pid} ->
        new_state = state + 1
        send(sender_pid, new_state)
        loop(new_state)

      :stop -> nil

      _ -> loop(state)
    end
  end

end
