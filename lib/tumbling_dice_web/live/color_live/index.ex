defmodule TumblingDiceWeb.ColorLive.Index do
  use TumblingDiceWeb, :live_view

  alias TumblingDice.Dice
  alias TumblingDice.Dice.Color

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, :colors, list_colors())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Color")
    |> assign(:color, Dice.get_color!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Color")
    |> assign(:color, %Color{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Colors")
    |> assign(:color, nil)
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    color = Dice.get_color!(id)
    {:ok, _} = Dice.delete_color(color)

    {:noreply, assign(socket, :colors, list_colors())}
  end

  defp list_colors do
    Dice.list_colors()
  end
end
