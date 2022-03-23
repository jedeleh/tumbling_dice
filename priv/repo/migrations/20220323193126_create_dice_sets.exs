defmodule TumblingDice.Repo.Migrations.CreateDiceSets do
  use Ecto.Migration

  def change do
    create table(:dice_sets) do
      add :description, :string
      add :count, :integer
      add :set_type, :string
      add :size, :string
      add :material, :string
      add :theme, :string
      add :brand, :string
      add :effects, :string
      add :image_url, :string

      timestamps()
    end
  end
end
