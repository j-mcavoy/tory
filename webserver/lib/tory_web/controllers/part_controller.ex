defmodule ToryWeb.PartController do
  use ToryWeb, :controller

  alias Tory.Part
  alias Tory.Part.Part, as: P

  def index(conn, _params) do
    parts = Part.list_parts()
    render(conn, "index.html", parts: parts)
  end

  def new(conn, _params) do
    changeset = Part.change_part(%P{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"part" => part_params}) do
    case Part.create_part(part_params) do
      {:ok, part} ->
        conn
        |> put_flash(:info, "Part created successfully.")
        |> redirect(to: Routes.part_path(conn, :show, part))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    part = Part.get_part_preloaded!(id)
    render(conn, "show.html", part: part)
  end

  def edit(conn, %{"id" => id}) do
    part = Part.get_part_preloaded!(id)
    changeset = Part.change_part(part)
    render(conn, "edit.html", part: part, changeset: changeset)
  end

  def populate_octopart(conn, %{} = part), do: Octopart.populate_octopart(part)

  def update(conn, %{"id" => id, "part" => part_params}) do
    part = Part.get_part!(id)

    case Part.update_part(part, part_params) do
      {:ok, part} ->
        conn
        |> put_flash(:info, "Part updated successfully.")
        |> redirect(to: Routes.part_path(conn, :show, part))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", part: part, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    part = Part.get_part!(id)
    {:ok, _part} = Part.delete_part(part)

    conn
    |> put_flash(:info, "Part deleted successfully.")
    |> redirect(to: Routes.part_path(conn, :index))
  end
end
