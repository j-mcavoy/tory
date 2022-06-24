defmodule Tory.Company do
  import Ecto.Query, warn: false
  alias Tory.Repo

  alias Tory.Company.Company

  def list_companys, do: Repo.all(Company)
  def get_company(id), do: Repo.get(Company, id)
  def get_company!(id), do: Repo.get!(Company, id)

  def upsert_company(%{id: id, name: name} = company) do
    case Repo.get_by(Company, name: name) do
      nil ->
        Repo.insert!(company)

      old_company ->
        change = Company.changeset(old_company, company)
        Repo.insert_or_update(change)
    end
  end
end
