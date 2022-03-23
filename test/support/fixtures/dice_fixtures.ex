defmodule TumblingDice.DiceFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `TumblingDice.Dice` context.
  """

  @doc """
  Generate a dice_set.
  """
  def dice_set_fixture(attrs \\ %{}) do
    {:ok, dice_set} =
      attrs
      |> Enum.into(%{
        brand: "some brand",
        count: 42,
        description: "some description",
        effects: "some effects",
        image_url: "some image_url",
        material: "some material",
        set_type: "some set_type",
        size: "some size",
        theme: "some theme"
      })
      |> TumblingDice.Dice.create_dice_set()

    dice_set
  end

  @doc """
  Generate a color.
  """
  def color_fixture(attrs \\ %{}) do
    {:ok, color} =
      attrs
      |> Enum.into(%{
        name: "some name",
        notes: "some notes"
      })
      |> TumblingDice.Dice.create_color()

    color
  end
end
