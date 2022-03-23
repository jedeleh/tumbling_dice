defmodule TumblingDiceWeb.DiceSetLive.FormComponent do
  use TumblingDiceWeb, :live_component

  alias TumblingDice.Dice

  @impl true
  def update(%{dice_set: dice_set} = assigns, socket) do
    changeset = Dice.change_dice_set(dice_set)

    {:ok,
     socket
     |> assign(assigns)
     |> assign(:changeset, changeset)}
  end

  @impl true
  def handle_event("validate", %{"dice_set" => dice_set_params}, socket) do
    changeset =
      socket.assigns.dice_set
      |> Dice.change_dice_set(dice_set_params)
      |> Map.put(:action, :validate)

    {:noreply, assign(socket, :changeset, changeset)}
  end

  def handle_event("save", %{"dice_set" => dice_set_params}, socket) do
    save_dice_set(socket, socket.assigns.action, dice_set_params)
  end

  defp save_dice_set(socket, :edit, dice_set_params) do
    case Dice.update_dice_set(socket.assigns.dice_set, dice_set_params) do
      {:ok, _dice_set} ->
        {:noreply,
         socket
         |> put_flash(:info, "Dice set updated successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, :changeset, changeset)}
    end
  end

  defp save_dice_set(socket, :new, dice_set_params) do
    case Dice.create_dice_set(dice_set_params) do
      {:ok, _dice_set} ->
        {:noreply,
         socket
         |> put_flash(:info, "Dice set created successfully")
         |> push_redirect(to: socket.assigns.return_to)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, changeset: changeset)}
    end
  end
end
