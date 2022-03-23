defmodule TumblingDice.Dice.DiceSet do
  use Ecto.Schema
  import Ecto.Changeset

  schema "dice_sets" do
    field :brand, :string
    field :count, :integer
    field :description, :string
    field :effects, :string
    field :image_url, :string
    field :material, :string
    field :set_type, :string
    field :size, :string
    field :theme, :string

    timestamps()
  end

  @doc false
  def changeset(dice_set, attrs) do
    dice_set
    |> cast(attrs, [:description, :count, :set_type, :size, :material, :theme, :brand, :effects, :image_url])
    |> validate_required([:description, :count, :set_type, :size, :material, :theme, :brand, :effects, :image_url])
  end
end
