defmodule ToryWeb.PartController do
  use ToryWeb, :controller

  alias Tory.Inventory
  alias Tory.Inventory.Part

  def index(conn, _params) do
    parts = Inventory.list_parts()
    render(conn, "index.html", parts: parts)
  end

  def new(conn, _params) do
    changeset = Inventory.change_part(%Part{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"part" => part_params}) do
    case Inventory.create_part(part_params) do
      {:ok, part} ->
        conn
        |> put_flash(:info, "Part created successfully.")
        |> redirect(to: Routes.part_path(conn, :show, part))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    part = Inventory.get_part_details!(id)
    render(conn, "show.html", part: part)
  end

  def edit(conn, %{"id" => id}) do
    part = Inventory.get_part!(id)
    changeset = Inventory.change_part(part)
    render(conn, "edit.html", part: part, changeset: changeset)
  end

  def update(conn, %{"id" => id, "part" => part_params}) do
    part = Inventory.get_part!(id)

    case Inventory.update_part(part, part_params) do
      {:ok, part} ->
        conn
        |> put_flash(:info, "Part updated successfully.")
        |> redirect(to: Routes.part_path(conn, :show, part))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", part: part, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    part = Inventory.get_part!(id)
    {:ok, _part} = Inventory.delete_part(part)

    conn
    |> put_flash(:info, "Part deleted successfully.")
    |> redirect(to: Routes.part_path(conn, :index))
  end
end
