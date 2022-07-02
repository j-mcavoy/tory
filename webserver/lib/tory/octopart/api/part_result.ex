defmodule Tory.Octopart.Api.PartResult do
  defstruct([
    :id,
    :name,
    :mpn,
    :short_description,
    :aka_mpns,
    :generic_mpn,
    :avg_avail,
    :total_avail,
    :slug,
    :manufacturer_url,
    :octopart_url,
    :best_datasheet,
    :best_image,
    :manufacturer,
    :specs
  ])

  alias __MODULE__.{Spec, Company}

  @type t :: %__MODULE__{
          id: integer,
          name: String.t(),
          mpn: String.t(),
          short_description: String.t(),
          aka_mpns: [String.t()],
          generic_mpn: String.t(),
          avg_avail: String.t(),
          total_avail: integer(),
          slug: String.t(),
          manufacturer_url: String.t(),
          octopart_url: String.t(),
          best_datasheet: String.t(),
          best_image: String.t(),
          manufacturer: Company.t(),
          specs: [Spec.t()]
        }

  defmodule __MODULE__.Company do
    defstruct [
      :id,
      :name,
      :homepage_url,
      :is_verified,
      :is_distributorapi,
      :display_flag,
      :slug,
      :aliases
    ]

    @type t :: %__MODULE__{
            id: integer,
            name: String.t(),
            homepage_url: String.t(),
            is_verified: boolean,
            is_distributorapi: boolean,
            display_flag: String.t(),
            slug: String.t(),
            aliases: [String.t()]
          }
  end

  defmodule __MODULE__.Spec do
    alias __MODULE__.Attribute
    defstruct [:display_value, :units, :value, :attribute]

    @type t :: %__MODULE__{
            display_value: String.t(),
            units: String.t(),
            value: String.t(),
            attribute: Attribute.t()
          }

    defmodule __MODULE__.Attribute do
      defstruct [:name, :shortname, :group]

      @type t :: %__MODULE__{
              name: Sting.t(),
              shortname: String.t(),
              group: String.t()
            }
    end
  end
end
