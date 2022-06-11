defmodule Tory.Inventory do
  @moduledoc """
  The Inventory context.
  """

  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Inventory.Location

  @doc """
  Returns the list of locations.

  ## Examples

      iex> list_locations()
      [%Location{}, ...]

  """
  def list_locations do
    Repo.all(Location)
  end

  @doc """
  Gets a single location.

  Raises `Ecto.NoResultsError` if the Location does not exist.

  ## Examples

      iex> get_location!(123)
      %Location{}

      iex> get_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_location!(id), do: Repo.get!(Location, id)

  @doc """
  Creates a location.

  ## Examples

      iex> create_location(%{field: value})
      {:ok, %Location{}}

      iex> create_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_location(attrs \\ %{}) do
    %Location{}
    |> Location.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a location.

  ## Examples

      iex> update_location(location, %{field: new_value})
      {:ok, %Location{}}

      iex> update_location(location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_location(%Location{} = location, attrs) do
    location
    |> Location.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a location.

  ## Examples

      iex> delete_location(location)
      {:ok, %Location{}}

      iex> delete_location(location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_location(%Location{} = location) do
    Repo.delete(location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking location changes.

  ## Examples

      iex> change_location(location)
      %Ecto.Changeset{data: %Location{}}

  """
  def change_location(%Location{} = location, attrs \\ %{}) do
    Location.changeset(location, attrs)
  end

  alias Tory.Inventory.Part

  @doc """
  Returns the list of parts.

  ## Examples

      iex> list_parts()
      [%Part{}, ...]

  """
  def list_parts do
    Repo.all(Part)
  end

  @doc """
  Gets a single part.

  Raises `Ecto.NoResultsError` if the Part does not exist.

  ## Examples

      iex> get_part!(123)
      %Part{}

      iex> get_part!(456)
      ** (Ecto.NoResultsError)

  """
  def get_part!(id), do: Repo.get!(Part, id)

  @doc """
  Creates a part.

  ## Examples

      iex> create_part(%{field: value})
      {:ok, %Part{}}

      iex> create_part(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_part(attrs \\ %{}) do
    %Part{}
    |> Part.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a part.

  ## Examples

      iex> update_part(part, %{field: new_value})
      {:ok, %Part{}}

      iex> update_part(part, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_part(%Part{} = part, attrs) do
    part
    |> Part.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a part.

  ## Examples

      iex> delete_part(part)
      {:ok, %Part{}}

      iex> delete_part(part)
      {:error, %Ecto.Changeset{}}

  """
  def delete_part(%Part{} = part) do
    Repo.delete(part)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking part changes.

  ## Examples

      iex> change_part(part)
      %Ecto.Changeset{data: %Part{}}

  """
  def change_part(%Part{} = part, attrs \\ %{}) do
    Part.changeset(part, attrs)
  end

  alias Tory.Inventory.PartLocation

  @doc """
  Returns the list of partlocations.

  ## Examples

      iex> list_partlocations()
      [%PartLocation{}, ...]

  """
  def list_partlocations do
    Repo.all(PartLocation)
  end

  @doc """
  Gets a single part_location.

  Raises `Ecto.NoResultsError` if the Part location does not exist.

  ## Examples

      iex> get_part_location!(123)
      %PartLocation{}

      iex> get_part_location!(456)
      ** (Ecto.NoResultsError)

  """
  def get_part_location!(id), do: Repo.get!(PartLocation, id)

  @doc """
  Creates a part_location.

  ## Examples

      iex> create_part_location(%{field: value})
      {:ok, %PartLocation{}}

      iex> create_part_location(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_part_location(attrs \\ %{}) do
    %PartLocation{}
    |> PartLocation.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a part_location.

  ## Examples

      iex> update_part_location(part_location, %{field: new_value})
      {:ok, %PartLocation{}}

      iex> update_part_location(part_location, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_part_location(%PartLocation{} = part_location, attrs) do
    part_location
    |> PartLocation.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a part_location.

  ## Examples

      iex> delete_part_location(part_location)
      {:ok, %PartLocation{}}

      iex> delete_part_location(part_location)
      {:error, %Ecto.Changeset{}}

  """
  def delete_part_location(%PartLocation{} = part_location) do
    Repo.delete(part_location)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking part_location changes.

  ## Examples

      iex> change_part_location(part_location)
      %Ecto.Changeset{data: %PartLocation{}}

  """
  def change_part_location(%PartLocation{} = part_location, attrs \\ %{}) do
    PartLocation.changeset(part_location, attrs)
  end
end
