defmodule Hello.Repo.Migrations.CreatePets do
  use Ecto.Migration

  def change do
    create table(:pets) do
      add :name, :string
      add :owner, :string
      add :age, :integer

      timestamps(type: :utc_datetime)
    end
  end
end
