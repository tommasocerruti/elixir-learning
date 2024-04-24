defmodule Forum.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :body, :string
      add :title, :string

      timestamps(type: :utc_datetime)
    end
  end
end
