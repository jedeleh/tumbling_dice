defmodule TumblingDiceWeb.DiceSetLive.Index do
  use TumblingDiceWeb, :live_view

  alias TumblingDice.Dice
  alias TumblingDice.Dice.DiceSet

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :dice_sets, list_dice_sets())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Dice set")
    |> assign(:dice_set, Dice.get_dice_set!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Dice set")
    |> assign(:dice_set, %DiceSet{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Dice sets")
    |> assign(:dice_set, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    dice_set = Dice.get_dice_set!(id)
    {:ok, _} = Dice.delete_dice_set(dice_set)

    {:noreply, assign(socket, :dice_sets, list_dice_sets())}
  end

  defp list_dice_sets do
    Dice.list_dice_sets()
  end
end
