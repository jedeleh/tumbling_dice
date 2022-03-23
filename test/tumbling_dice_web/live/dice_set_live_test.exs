defmodule TumblingDiceWeb.DiceSetLiveTest do
  use TumblingDiceWeb.ConnCase

  import Phoenix.LiveViewTest
  import TumblingDice.DiceFixtures

  @create_attrs %{brand: "some brand", count: 42, description: "some description", effects: "some effects", image_url: "some image_url", material: "some material", set_type: "some set_type", size: "some size", theme: "some theme"}
  @update_attrs %{brand: "some updated brand", count: 43, description: "some updated description", effects: "some updated effects", image_url: "some updated image_url", material: "some updated material", set_type: "some updated set_type", size: "some updated size", theme: "some updated theme"}
  @invalid_attrs %{brand: nil, count: nil, description: nil, effects: nil, image_url: nil, material: nil, set_type: nil, size: nil, theme: nil}

  defp create_dice_set(_) do
    dice_set = dice_set_fixture()
    %{dice_set: dice_set}
  end

  describe "Index" do
    setup [:create_dice_set]

    test "lists all dice_sets", %{conn: conn, dice_set: dice_set} do
      {:ok, _index_live, html} = live(conn, Routes.dice_set_index_path(conn, :index))

      assert html =~ "Listing Dice sets"
      assert html =~ dice_set.brand
    end

    test "saves new dice_set", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, Routes.dice_set_index_path(conn, :index))

      assert index_live |> element("a", "New Dice set") |> render_click() =~
               "New Dice set"

      assert_patch(index_live, Routes.dice_set_index_path(conn, :new))

      assert index_live
             |> form("#dice_set-form", dice_set: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#dice_set-form", dice_set: @create_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.dice_set_index_path(conn, :index))

      assert html =~ "Dice set created successfully"
      assert html =~ "some brand"
    end

    test "updates dice_set in listing", %{conn: conn, dice_set: dice_set} do
      {:ok, index_live, _html} = live(conn, Routes.dice_set_index_path(conn, :index))

      assert index_live |> element("#dice_set-#{dice_set.id} a", "Edit") |> render_click() =~
               "Edit Dice set"

      assert_patch(index_live, Routes.dice_set_index_path(conn, :edit, dice_set))

      assert index_live
             |> form("#dice_set-form", dice_set: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        index_live
        |> form("#dice_set-form", dice_set: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.dice_set_index_path(conn, :index))

      assert html =~ "Dice set updated successfully"
      assert html =~ "some updated brand"
    end

    test "deletes dice_set in listing", %{conn: conn, dice_set: dice_set} do
      {:ok, index_live, _html} = live(conn, Routes.dice_set_index_path(conn, :index))

      assert index_live |> element("#dice_set-#{dice_set.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#dice_set-#{dice_set.id}")
    end
  end

  describe "Show" do
    setup [:create_dice_set]

    test "displays dice_set", %{conn: conn, dice_set: dice_set} do
      {:ok, _show_live, html} = live(conn, Routes.dice_set_show_path(conn, :show, dice_set))

      assert html =~ "Show Dice set"
      assert html =~ dice_set.brand
    end

    test "updates dice_set within modal", %{conn: conn, dice_set: dice_set} do
      {:ok, show_live, _html} = live(conn, Routes.dice_set_show_path(conn, :show, dice_set))

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Dice set"

      assert_patch(show_live, Routes.dice_set_show_path(conn, :edit, dice_set))

      assert show_live
             |> form("#dice_set-form", dice_set: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      {:ok, _, html} =
        show_live
        |> form("#dice_set-form", dice_set: @update_attrs)
        |> render_submit()
        |> follow_redirect(conn, Routes.dice_set_show_path(conn, :show, dice_set))

      assert html =~ "Dice set updated successfully"
      assert html =~ "some updated brand"
    end
  end
end
