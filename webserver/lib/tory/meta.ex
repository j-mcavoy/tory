defmodule Tory.Meta do
  @moduledoc """
  The Meta context.
  """

  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Meta.Parameter

  @doc """
  Returns the list of parameters.

  ## Examples

      iex> list_parameters()
      [%Parameter{}, ...]

  """
  def list_parameters do
    Repo.all(Parameter)
  end

  @doc """
  Gets a single parameter.

  Raises `Ecto.NoResultsError` if the Parameter does not exist.

  ## Examples

      iex> get_parameter!(123)
      %Parameter{}

      iex> get_parameter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_parameter!(id), do: Repo.get!(Parameter, id)

  @doc """
  Creates a parameter.

  ## Examples

      iex> create_parameter(%{field: value})
      {:ok, %Parameter{}}

      iex> create_parameter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_parameter(attrs \\ %{}) do
    %Parameter{}
    |> Parameter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a parameter.

  ## Examples

      iex> update_parameter(parameter, %{field: new_value})
      {:ok, %Parameter{}}

      iex> update_parameter(parameter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_parameter(%Parameter{} = parameter, attrs) do
    parameter
    |> Parameter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a parameter.

  ## Examples

      iex> delete_parameter(parameter)
      {:ok, %Parameter{}}

      iex> delete_parameter(parameter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_parameter(%Parameter{} = parameter) do
    Repo.delete(parameter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking parameter changes.

  ## Examples

      iex> change_parameter(parameter)
      %Ecto.Changeset{data: %Parameter{}}

  """
  def change_parameter(%Parameter{} = parameter, attrs \\ %{}) do
    Parameter.changeset(parameter, attrs)
  end

  alias Tory.Meta.PartParameter

  @doc """
  Returns the list of partparameters.

  ## Examples

      iex> list_partparameters()
      [%PartParameter{}, ...]

  """
  def list_partparameters do
    Repo.all(PartParameter)
  end

  @doc """
  Gets a single part_parameter.

  Raises `Ecto.NoResultsError` if the Part parameter does not exist.

  ## Examples

      iex> get_part_parameter!(123)
      %PartParameter{}

      iex> get_part_parameter!(456)
      ** (Ecto.NoResultsError)

  """
  def get_part_parameter!(id), do: Repo.get!(PartParameter, id)

  @doc """
  Creates a part_parameter.

  ## Examples

      iex> create_part_parameter(%{field: value})
      {:ok, %PartParameter{}}

      iex> create_part_parameter(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_part_parameter(attrs \\ %{}) do
    %PartParameter{}
    |> PartParameter.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a part_parameter.

  ## Examples

      iex> update_part_parameter(part_parameter, %{field: new_value})
      {:ok, %PartParameter{}}

      iex> update_part_parameter(part_parameter, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_part_parameter(%PartParameter{} = part_parameter, attrs) do
    part_parameter
    |> PartParameter.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a part_parameter.

  ## Examples

      iex> delete_part_parameter(part_parameter)
      {:ok, %PartParameter{}}

      iex> delete_part_parameter(part_parameter)
      {:error, %Ecto.Changeset{}}

  """
  def delete_part_parameter(%PartParameter{} = part_parameter) do
    Repo.delete(part_parameter)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking part_parameter changes.

  ## Examples

      iex> change_part_parameter(part_parameter)
      %Ecto.Changeset{data: %PartParameter{}}

  """
  def change_part_parameter(%PartParameter{} = part_parameter, attrs \\ %{}) do
    PartParameter.changeset(part_parameter, attrs)
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
