alias Tory.Repo
alias Tory.Inventory.{Location, Inventory}
alias Tory.Part.Part

%Part{id: 0, mpn: "1N914"} |> Repo.insert!()
%Part{id: 1, mpn: "555"} |> Repo.insert!()

%Location{
  id: 0,
  name: "Diodes"
}
|> Repo.insert!()

%Inventory{
  location_id: 0,
  part_id: 0,
  count: 10
}
|> Repo.insert!()
