alias Tory.Repo
alias Tory.Inventory.{Location, Stock}
alias Tory.Part.Part

%Part{
  id: 0,
  mpn: "1N914-T50A"
}
|> Repo.insert!()

%Location{
  id: 0,
  name: "Diodes"
}
|> Repo.insert!()

%Stock{
  location_id: 0,
  part_id: 0,
  count: 10
}
|> Repo.insert!()
