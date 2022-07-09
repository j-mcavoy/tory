defmodule Tory.Octopart.Api.PartResult do
  alias __MODULE__.{Spec, Spec.Attribute, Company}

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
    :datasheet,
    :image,
    :company,
    :specs
  ])

  @type t :: %__MODULE__{
          id: String.t(),
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
          datasheet: %{url: String.t()},
          image: %{url: String.t()},
          company: Company.t(),
          specs: [Spec.t()]
        }

  @spec into_map(PartResult.t()) :: map()
  def into_map(%__MODULE__{} = pr) do
    %{
      Map.from_struct(pr)
      | company: Company.into_map(pr.company),
        specs: Enum.map(pr.specs, &Spec.into_map(&1))
    }
  end

  defmodule __MODULE__.Company do
    alias __MODULE__.Alias

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
            id: String.t(),
            name: String.t(),
            homepage_url: String.t(),
            is_verified: boolean,
            is_distributorapi: boolean,
            display_flag: String.t(),
            slug: String.t(),
            aliases: [Alias.t()]
          }
    @spec into_map(__MODULE__.t()) :: map()
    def into_map(%__MODULE__{} = c),
      do: %{Map.from_struct(c) | aliases: Enum.map(c.aliases, &Alias.into_map/1)}

    defmodule __MODULE__.Alias do
      defstruct [
        :alias
      ]

      @type t :: %__MODULE__{
              alias: String.t()
            }

      @spec into_map(__MODULE__.t()) :: map()
      def into_map(%__MODULE__{} = a), do: Map.from_struct(a)
    end
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

    @spec into_map(__MODULE__.t()) :: map()
    def into_map(%Spec{} = s) do
      %{Map.from_struct(s) | attribute: Attribute.into_map(s.attribute)}
    end

    defmodule __MODULE__.Attribute do
      defstruct [:name, :shortname, :group]

      @type t :: %__MODULE__{
              name: Sting.t(),
              shortname: String.t(),
              group: String.t()
            }
      @spec into_map(__MODULE__.t()) :: map()
      def into_map(%__MODULE__{} = a), do: Map.from_struct(a)
    end
  end
end
