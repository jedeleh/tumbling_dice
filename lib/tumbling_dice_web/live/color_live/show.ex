defmodule TumblingDiceWeb.ColorLive.Show do
  use TumblingDiceWeb, :live_view

  alias TumblingDice.Dice

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:color, Dice.get_color!(id))}
  end

  defp page_title(:show), do: "Show Color"
  defp page_title(:edit), do: "Edit Color"
end
