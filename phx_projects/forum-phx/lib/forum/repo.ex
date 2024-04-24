defmodule Forum.Repo do
  use Ecto.Repo,
    otp_app: :forum,
    adapter: Ecto.Adapters.SQLite3
end
