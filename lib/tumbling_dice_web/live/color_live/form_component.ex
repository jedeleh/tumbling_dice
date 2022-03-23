defmodule TumblingDiceWeb.ColorLive.FormComponent do
  use TumblingDiceWeb, :live_component

  alias TumblingDice.Dice

  @impl true
  def update(%{color: color} = assigns, socket) do
    changeset = Dice.change_color(color)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"color" => color_params}, socket) do
    changeset =
      socket.assigns.color
      |> Dice.change_color(color_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"color" => color_params}, socket) do
    save_color(socket, socket.assigns.action, color_params)
  end

  defp save_color(socket, :edit, color_params) do
    case Dice.update_color(socket.assigns.color, color_params) do
      {:ok, _color} ->
        {:noreply,
         socket
         |> put_flash(:info, "Color updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_color(socket, :new, color_params) do
    case Dice.create_color(color_params) do
      {:ok, _color} ->
        {:noreply,
         socket
         |> put_flash(:info, "Color created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
