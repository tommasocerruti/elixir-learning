defmodule ForumWeb.PageController do
  use ForumWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    users=[
      %{id: 1, name: "Tommaso", email: "tommasocerruti@gmail.com"},
      %{id: 2, name: "Irmak", email: "irmakyagmurlu@gmail.com"},
      %{id: 3, name: "Shark", email: "thebestshark@gmail.com"}
    ]
    json(conn, %{users: users})
  end
end
