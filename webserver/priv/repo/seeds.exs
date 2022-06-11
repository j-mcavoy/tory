alias Tory.Repo
alias Tory.Inventory.{Part, Location}
alias Tory.Meta.{Parameter, PartParameter}

%Part{
  id: 0,
  barcode: "1N914-T50A",
  datasheet:
    "https://rocelec.widen.net/view/pdf/bhc41r7lwc/ONSM-S-A0003539415-1.pdf?t.download=true&u=5oefqw",
  description: "DIODE GEN PURP 100V 200MA DO35",
  mpn: "1N914-T50A",
  octopart_uuid: nil
}
|> Repo.insert!()

%Parameter{
  id: 0,
  name: "Package",
  value: "DO−35"
}
|> Repo.insert!()

# [
#  %Distributor{id: 0, name: "Digi-Key", website: "https://www.digikey.com/"},
#  %Manufacturer{
#    id: 0,
#    name: "onsemi",
#    website: "https://www.digikey.com/en/supplier-centers/onsemi"
#  },
#  %Location{
#    id: 0,
#    name: "Diodes"
#  },
#  %Locations2Parts{
#    location_id: 0,
#    part_id: 0,
#    quantity: 10
#  },
#  %Parts2Distributors{
#    part_id: 0,
#    distributor_id: 0
#  },
#  %Parts2Parameters{
#    part_id: 0,
#    parameter_id: 0
#  }
# ]
# |> Enum.map(&Repo.insert!/1)
