defmodule TumblingDice.Dice do
  @moduledoc """
  The Dice context.
  """

  import Ecto.Query, warn: false
  alias TumblingDice.Repo

  alias TumblingDice.Dice.DiceSet

  @doc """
  Returns the list of dice_sets.

  ## Examples

      iex> list_dice_sets()
      [%DiceSet{}, ...]

  """
  def list_dice_sets do
    Repo.all(DiceSet)
  end

  @doc """
  Gets a single dice_set.

  Raises `Ecto.NoResultsError` if the Dice set does not exist.

  ## Examples

      iex> get_dice_set!(123)
      %DiceSet{}

      iex> get_dice_set!(456)
      ** (Ecto.NoResultsError)

  """
  def get_dice_set!(id), do: Repo.get!(DiceSet, id)

  @doc """
  Creates a dice_set.

  ## Examples

      iex> create_dice_set(%{field: value})
      {:ok, %DiceSet{}}

      iex> create_dice_set(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_dice_set(attrs \\ %{}) do
    %DiceSet{}
    |> DiceSet.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a dice_set.

  ## Examples

      iex> update_dice_set(dice_set, %{field: new_value})
      {:ok, %DiceSet{}}

      iex> update_dice_set(dice_set, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_dice_set(%DiceSet{} = dice_set, attrs) do
    dice_set
    |> DiceSet.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a dice_set.

  ## Examples

      iex> delete_dice_set(dice_set)
      {:ok, %DiceSet{}}

      iex> delete_dice_set(dice_set)
      {:error, %Ecto.Changeset{}}

  """
  def delete_dice_set(%DiceSet{} = dice_set) do
    Repo.delete(dice_set)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking dice_set changes.

  ## Examples

      iex> change_dice_set(dice_set)
      %Ecto.Changeset{data: %DiceSet{}}

  """
  def change_dice_set(%DiceSet{} = dice_set, attrs \\ %{}) do
    DiceSet.changeset(dice_set, attrs)
  end

  alias TumblingDice.Dice.Color

  @doc """
  Returns the list of colors.

  ## Examples

      iex> list_colors()
      [%Color{}, ...]

  """
  def list_colors do
    Repo.all(Color)
  end

  @doc """
  Gets a single color.

  Raises `Ecto.NoResultsError` if the Color does not exist.

  ## Examples

      iex> get_color!(123)
      %Color{}

      iex> get_color!(456)
      ** (Ecto.NoResultsError)

  """
  def get_color!(id), do: Repo.get!(Color, id)

  @doc """
  Creates a color.

  ## Examples

      iex> create_color(%{field: value})
      {:ok, %Color{}}

      iex> create_color(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_color(attrs \\ %{}) do
    %Color{}
    |> Color.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a color.

  ## Examples

      iex> update_color(color, %{field: new_value})
      {:ok, %Color{}}

      iex> update_color(color, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_color(%Color{} = color, attrs) do
    color
    |> Color.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a color.

  ## Examples

      iex> delete_color(color)
      {:ok, %Color{}}

      iex> delete_color(color)
      {:error, %Ecto.Changeset{}}

  """
  def delete_color(%Color{} = color) do
    Repo.delete(color)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking color changes.

  ## Examples

      iex> change_color(color)
      %Ecto.Changeset{data: %Color{}}

  """
  def change_color(%Color{} = color, attrs \\ %{}) do
    Color.changeset(color, attrs)
  end
end
