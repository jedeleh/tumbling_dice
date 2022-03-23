defmodule TumblingDice.Dice.Color do
  use Ecto.Schema
  import Ecto.Changeset

  schema "colors" do
    field :name, :string
    field :notes, :string

    timestamps()
  end

  @doc false
  def changeset(color, attrs) do
    color
    |> cast(attrs, [:name, :notes])
    |> validate_required([:name, :notes])
  end
end
