defmodule TumblingDice.DiceTest do
  use TumblingDice.DataCase

  alias TumblingDice.Dice

  describe "dice_sets" do
    alias TumblingDice.Dice.DiceSet

    import TumblingDice.DiceFixtures

    @invalid_attrs %{brand: nil, count: nil, description: nil, effects: nil, image_url: nil, material: nil, set_type: nil, size: nil, theme: nil}

    test "list_dice_sets/0 returns all dice_sets" do
      dice_set = dice_set_fixture()
      assert Dice.list_dice_sets() == [dice_set]
    end

    test "get_dice_set!/1 returns the dice_set with given id" do
      dice_set = dice_set_fixture()
      assert Dice.get_dice_set!(dice_set.id) == dice_set
    end

    test "create_dice_set/1 with valid data creates a dice_set" do
      valid_attrs = %{brand: "some brand", count: 42, description: "some description", effects: "some effects", image_url: "some image_url", material: "some material", set_type: "some set_type", size: "some size", theme: "some theme"}

      assert {:ok, %DiceSet{} = dice_set} = Dice.create_dice_set(valid_attrs)
      assert dice_set.brand == "some brand"
      assert dice_set.count == 42
      assert dice_set.description == "some description"
      assert dice_set.effects == "some effects"
      assert dice_set.image_url == "some image_url"
      assert dice_set.material == "some material"
      assert dice_set.set_type == "some set_type"
      assert dice_set.size == "some size"
      assert dice_set.theme == "some theme"
    end

    test "create_dice_set/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dice.create_dice_set(@invalid_attrs)
    end

    test "update_dice_set/2 with valid data updates the dice_set" do
      dice_set = dice_set_fixture()
      update_attrs = %{brand: "some updated brand", count: 43, description: "some updated description", effects: "some updated effects", image_url: "some updated image_url", material: "some updated material", set_type: "some updated set_type", size: "some updated size", theme: "some updated theme"}

      assert {:ok, %DiceSet{} = dice_set} = Dice.update_dice_set(dice_set, update_attrs)
      assert dice_set.brand == "some updated brand"
      assert dice_set.count == 43
      assert dice_set.description == "some updated description"
      assert dice_set.effects == "some updated effects"
      assert dice_set.image_url == "some updated image_url"
      assert dice_set.material == "some updated material"
      assert dice_set.set_type == "some updated set_type"
      assert dice_set.size == "some updated size"
      assert dice_set.theme == "some updated theme"
    end

    test "update_dice_set/2 with invalid data returns error changeset" do
      dice_set = dice_set_fixture()
      assert {:error, %Ecto.Changeset{}} = Dice.update_dice_set(dice_set, @invalid_attrs)
      assert dice_set == Dice.get_dice_set!(dice_set.id)
    end

    test "delete_dice_set/1 deletes the dice_set" do
      dice_set = dice_set_fixture()
      assert {:ok, %DiceSet{}} = Dice.delete_dice_set(dice_set)
      assert_raise Ecto.NoResultsError, fn -> Dice.get_dice_set!(dice_set.id) end
    end

    test "change_dice_set/1 returns a dice_set changeset" do
      dice_set = dice_set_fixture()
      assert %Ecto.Changeset{} = Dice.change_dice_set(dice_set)
    end
  end

  describe "colors" do
    alias TumblingDice.Dice.Color

    import TumblingDice.DiceFixtures

    @invalid_attrs %{name: nil, notes: nil}

    test "list_colors/0 returns all colors" do
      color = color_fixture()
      assert Dice.list_colors() == [color]
    end

    test "get_color!/1 returns the color with given id" do
      color = color_fixture()
      assert Dice.get_color!(color.id) == color
    end

    test "create_color/1 with valid data creates a color" do
      valid_attrs = %{name: "some name", notes: "some notes"}

      assert {:ok, %Color{} = color} = Dice.create_color(valid_attrs)
      assert color.name == "some name"
      assert color.notes == "some notes"
    end

    test "create_color/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Dice.create_color(@invalid_attrs)
    end

    test "update_color/2 with valid data updates the color" do
      color = color_fixture()
      update_attrs = %{name: "some updated name", notes: "some updated notes"}

      assert {:ok, %Color{} = color} = Dice.update_color(color, update_attrs)
      assert color.name == "some updated name"
      assert color.notes == "some updated notes"
    end

    test "update_color/2 with invalid data returns error changeset" do
      color = color_fixture()
      assert {:error, %Ecto.Changeset{}} = Dice.update_color(color, @invalid_attrs)
      assert color == Dice.get_color!(color.id)
    end

    test "delete_color/1 deletes the color" do
      color = color_fixture()
      assert {:ok, %Color{}} = Dice.delete_color(color)
      assert_raise Ecto.NoResultsError, fn -> Dice.get_color!(color.id) end
    end

    test "change_color/1 returns a color changeset" do
      color = color_fixture()
      assert %Ecto.Changeset{} = Dice.change_color(color)
    end
  end
end
