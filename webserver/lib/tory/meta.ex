defmodule Tory.Meta do
  @moduledoc """
  The Meta context.
  """

  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Meta.Attribute

  @doc """
  Returns the list of attributes.

  ## Examples

      iex> list_attributes()
      [%Attribute{}, ...]

  """
  def list_attributes do
    Repo.all(Attribute)
  end

  @doc """
  Gets a single attribute.

  Raises `Ecto.NoResultsError` if the Attribute does not exist.

  ## Examples

      iex> get_attribute!(123)
      %Attribute{}

      iex> get_attribute!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attribute!(id), do: Repo.get!(Attribute, id)

  @doc """
  Creates a attribute.

  ## Examples

      iex> create_attribute(%{field: value})
      {:ok, %Attribute{}}

      iex> create_attribute(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attribute(attrs \\ %{}) do
    %Attribute{}
    |> Attribute.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a attribute.

  ## Examples

      iex> update_attribute(attribute, %{field: new_value})
      {:ok, %Attribute{}}

      iex> update_attribute(attribute, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attribute(%Attribute{} = attribute, attrs) do
    attribute
    |> Attribute.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a attribute.

  ## Examples

      iex> delete_attribute(attribute)
      {:ok, %Attribute{}}

      iex> delete_attribute(attribute)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attribute(%Attribute{} = attribute) do
    Repo.delete(attribute)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attribute changes.

  ## Examples

      iex> change_attribute(attribute)
      %Ecto.Changeset{data: %Attribute{}}

  """
  def change_attribute(%Attribute{} = attribute, attrs \\ %{}) do
    Attribute.changeset(attribute, attrs)
  end

  alias Tory.Meta.Icon

  @doc """
  Returns the list of icons.

  ## Examples

      iex> list_icons()
      [%Icon{}, ...]

  """
  def list_icons do
    Repo.all(Icon)
  end

  @doc """
  Gets a single icon.

  Raises `Ecto.NoResultsError` if the Icon does not exist.

  ## Examples

      iex> get_icon!(123)
      %Icon{}

      iex> get_icon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_icon!(id), do: Repo.get!(Icon, id)

  @doc """
  Creates a icon.

  ## Examples

      iex> create_icon(%{field: value})
      {:ok, %Icon{}}

      iex> create_icon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_icon(attrs \\ %{}) do
    %Icon{}
    |> Icon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a icon.

  ## Examples

      iex> update_icon(icon, %{field: new_value})
      {:ok, %Icon{}}

      iex> update_icon(icon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_icon(%Icon{} = icon, attrs) do
    icon
    |> Icon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a icon.

  ## Examples

      iex> delete_icon(icon)
      {:ok, %Icon{}}

      iex> delete_icon(icon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_icon(%Icon{} = icon) do
    Repo.delete(icon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking icon changes.

  ## Examples

      iex> change_icon(icon)
      %Ecto.Changeset{data: %Icon{}}

  """
  def change_icon(%Icon{} = icon, attrs \\ %{}) do
    Icon.changeset(icon, attrs)
  end
end
