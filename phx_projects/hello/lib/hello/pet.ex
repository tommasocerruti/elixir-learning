defmodule Hello.Pet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "pets" do
    field :name, :string
    field :owner, :string
    field :age, :integer

    timestamps(type: :utc_datetime)
  end

  @spec changeset(
          {map(), map()}
          | %{
              :__struct__ => atom() | %{:__changeset__ => map(), optional(any()) => any()},
              optional(atom()) => any()
            },
          :invalid | %{optional(:__struct__) => none(), optional(atom() | binary()) => any()}
        ) :: Ecto.Changeset.t()
  @doc false
  def changeset(pet, attrs) do
    pet
    |> cast(attrs, [:name, :owner, :age])
    |> validate_required([:name, :owner, :age])
  end
end
