defmodule TumblingDice.Repo.Migrations.CreateColors do
  use Ecto.Migration

  def change do
    create table(:colors) do
      add :name, :string
      add :notes, :string

      timestamps()
    end
  end
end
