defmodule Tory.PartResultFixtures do
  alias Tory.Octopart.Api.PartResult
  alias Tory.Octopart.Api.PartResult.{Company, Spec}
  alias Tory.Octopart.Api.PartResult.Company.Alias
  alias Tory.Octopart.Api.PartResult.Spec.Attribute

  def part_result_fixture,
    do: %{
      __struct__: Tory.Octopart.Api.PartResult,
      aka_mpns: ["1N914.", "1N914.."],
      avg_avail: 59275,
      best_datasheet:
        "http://datasheet.octopart.com/1N914-ON-Semiconductor-datasheet-42765246.pdf",
      best_image: "https://sigma.octopart.com/21355526/image/ON-Semiconductor-1N914.jpg",
      estimated_factory_lead_days: 224,
      free_sample_url: nil,
      generic_mpn: "1N914",
      id: "84323160",
      company: %Tory.Octopart.Api.PartResult.Company{
        id: "",
        aliases: [
          %Alias{alias: "ON Semiconductor"},
          %Alias{alias: "ONS"},
          %Alias{alias: "ONSEMICON"},
          %Alias{alias: "ON SEM"},
          %Alias{alias: "ON SEMICONDUCTO"},
          %Alias{alias: "ON SEMICONDUCTORS"},
          %Alias{alias: "ONSEMIC"},
          %Alias{alias: "ON SEMICONDU"},
          %Alias{alias: "OSC"},
          %Alias{alias: "ONSE"},
          %Alias{alias: "SCG"},
          %Alias{alias: "ON SEMICOND"},
          %Alias{alias: "ON SEMICONDUCTOR COR"},
          %Alias{alias: "ONSM"},
          %Alias{alias: "ON Semiconductor / Fairchild"},
          %Alias{alias: "ON SEMICO"},
          %Alias{alias: "MOT/ON SEMI"},
          %Alias{alias: "ON SEMICONDUCTOR CORPORATION"},
          %Alias{alias: "ON4"},
          %Alias{alias: "ON SEMICONDUCTOR CORP"},
          %Alias{alias: "Fairchild (ON Semiconductor)"},
          %Alias{alias: "ON SEMICONDUCT"},
          %Alias{alias: "onsemi / Fairchild"},
          %Alias{alias: "ON-SEMI SCG"},
          %Alias{alias: "ON SEMICONDUTOR"},
          %Alias{alias: "ON Semiconductor Inc."},
          %Alias{alias: "onsemiconductor"}
        ],
        display_flag: "US",
        homepage_url: "https://www.onsemi.com/",
        id: "278",
        is_distributorapi: false,
        is_verified: false,
        name: "onsemi",
        slug: "onsemi"
      },
      manufacturer_url:
        "https://octopart.com/opatz8j6/b1?t=ccBBR-ijHX32HBJJ6x2yN2AstyVV08GmYC-VClLff0tiIj_oC0zaM5IDPaEMLPGMLxYbC5U1ilQ9sfy1NId0Wx_5eTtyFc3MqG2e-mj28Mf1CgjOYnQoI6wolMwPalB0Ii_oKFh8F78AIndw52WziSvHJLlRZyEH0QOHKzpaWXhoTHqJDbU7oHt88Yjgeh033qjLZohlZ4XuJTcEslvUcyNACWTjfQ2gZ7-v7iJr8fF_e2OgjerxqWP6ZjM4mbs",
      mpn: "1N914",
      name: "onsemi 1N914",
      octopart_url: "https://octopart.com/1n914-onsemi-84323160",
      short_description: "Rectifier Diode, 1 Phase, 1 Element, 0.2A, 100V V(RRM), Silicon, DO-35",
      slug: "/1n914-onsemi-84323160",
      specs: [
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Average Rectified Current",
            shortname: "averagerectifiedcurrent"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Capacitance",
            shortname: "capacitance"
          },
          display_value: "4 pF",
          units: "pF",
          value: "4"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Physical",
            name: "Case/Package",
            shortname: "case_package"
          },
          display_value: "Axial",
          units: "",
          value: "Axial"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Current Rating",
            shortname: "currentrating"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Element Configuration",
            shortname: "elementconfiguration"
          },
          display_value: "Single",
          units: "",
          value: "Single"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Forward Current",
            shortname: "forwardcurrent"
          },
          display_value: "10 mA",
          units: "mA",
          value: "10"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Forward Voltage",
            shortname: "forwardvoltage"
          },
          display_value: "1 V",
          units: "V",
          value: "1"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Dimensions",
            name: "Height",
            shortname: "height"
          },
          display_value: "1.91 mm",
          units: "mm",
          value: "1.91"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Compliance",
            name: "Lead Free",
            shortname: "leadfree"
          },
          display_value: "Lead Free",
          units: "",
          value: "Lead Free"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Dimensions",
            name: "Length",
            shortname: "length"
          },
          display_value: "4.56 mm",
          units: "mm",
          value: "4.56"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Supply Chain",
            name: "Lifecycle Status",
            shortname: "lifecyclestatus"
          },
          display_value: "Production (Last Updated: 1 year ago)",
          units: "",
          value: "Production"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Supply Chain",
            name: "Manufacturer Lifecycle Status",
            shortname: "manufacturerlifecyclestatus"
          },
          display_value: "ACTIVE (Last Updated: 1 year ago)",
          units: "",
          value: "ACTIVE"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Forward Surge Current (Ifsm)",
            shortname: "maxforwardsurgecurrent_ifsm_"
          },
          display_value: "1 A",
          units: "A",
          value: "1"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Junction Temperature (Tj)",
            shortname: "maxjunctiontemperature"
          },
          display_value: "175 °C",
          units: "°C",
          value: "175"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Operating Temperature",
            shortname: "maxoperatingtemperature"
          },
          display_value: "175 °C",
          units: "°C",
          value: "175"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Power Dissipation",
            shortname: "maxpowerdissipation"
          },
          display_value: "500 mW",
          units: "mW",
          value: "500"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Repetitive Reverse Voltage (Vrrm)",
            shortname: "maxrepetitivereversevoltage_vrrm_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Reverse Voltage (DC)",
            shortname: "maxreversevoltage_dc_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Max Surge Current",
            shortname: "maxsurgecurrent"
          },
          display_value: "4 A",
          units: "A",
          value: "4"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Min Operating Temperature",
            shortname: "minoperatingtemperature"
          },
          display_value: "-65 °C",
          units: "°C",
          value: "-65"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Physical",
            name: "Mount",
            shortname: "mount"
          },
          display_value: "Through Hole",
          units: "",
          value: "Through Hole"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Physical",
            name: "Number of Pins",
            shortname: "numberofpins"
          },
          display_value: "2",
          units: "",
          value: "2"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Output Current",
            shortname: "outputcurrent"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Packaging",
            shortname: "packaging"
          },
          display_value: "Bulk",
          units: "",
          value: "Bulk"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Peak Non-Repetitive Surge Current",
            shortname: "peaknon_repetitivesurgecurrent"
          },
          display_value: "4 A",
          units: "A",
          value: "4"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Peak Reverse Current",
            shortname: "peakreversecurrent"
          },
          display_value: "5 µA",
          units: "µA",
          value: "5"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Polarity",
            shortname: "polarity"
          },
          display_value: "Standard",
          units: "",
          value: "Standard"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Power Dissipation",
            shortname: "powerdissipation"
          },
          display_value: "500 mW",
          units: "mW",
          value: "500"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Compliance",
            name: "Radiation Hardening",
            shortname: "radiationhardening"
          },
          display_value: "No",
          units: "",
          value: "No"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Compliance",
            name: "REACH SVHC",
            shortname: "reachsvhc"
          },
          display_value: "No SVHC",
          units: "",
          value: "No SVHC"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Recovery Time",
            shortname: "recoverytime"
          },
          display_value: "4 ns",
          units: "ns",
          value: "4"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Reverse Recovery Time",
            shortname: "reverserecoverytime"
          },
          display_value: "4 ns",
          units: "ns",
          value: "4"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Reverse Voltage",
            shortname: "reversevoltage"
          },
          display_value: "75 V",
          units: "V",
          value: "75"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Compliance",
            name: "RoHS",
            shortname: "rohs"
          },
          display_value: "Compliant",
          units: "",
          value: "Compliant"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Schedule B",
            shortname: "scheduleB"
          },
          display_value: "8541100070, 8541100070|8541100070|8541100070|8541100070|8541100070",
          units: ", ",
          value: "8541100070, 8541100070|8541100070|8541100070|8541100070|8541100070"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Technical",
            name: "Voltage Rating (DC)",
            shortname: "voltagerating_dc_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Physical",
            name: "Weight",
            shortname: "weight"
          },
          display_value: "80 g",
          units: "g",
          value: "80"
        },
        %Tory.Octopart.Api.PartResult.Spec{
          attribute: %Tory.Octopart.Api.PartResult.Spec.Attribute{
            group: "Dimensions",
            name: "Width",
            shortname: "width"
          },
          display_value: "1.91 mm",
          units: "mm",
          value: "1.91"
        }
      ],
      total_avail: 6_579_615
    }

  def part_result_map_fixture,
    do: %{
      aka_mpns: ["1N914.", "1N914.."],
      avg_avail: 59275,
      best_datasheet:
        "http://datasheet.octopart.com/1N914-ON-Semiconductor-datasheet-42765246.pdf",
      best_image: "https://sigma.octopart.com/21355526/image/ON-Semiconductor-1N914.jpg",
      estimated_factory_lead_days: 224,
      free_sample_url: nil,
      generic_mpn: "1N914",
      id: "84323160",
      company: %{
        aliases: [
          %{alias: "ON Semiconductor"},
          %{alias: "ONS"},
          %{alias: "ONSEMICON"},
          %{alias: "ON SEM"},
          %{alias: "ON SEMICONDUCTO"},
          %{alias: "ON SEMICONDUCTORS"},
          %{alias: "ONSEMIC"},
          %{alias: "ON SEMICONDU"},
          %{alias: "OSC"},
          %{alias: "ONSE"},
          %{alias: "SCG"},
          %{alias: "ON SEMICOND"},
          %{alias: "ON SEMICONDUCTOR COR"},
          %{alias: "ONSM"},
          %{alias: "ON Semiconductor / Fairchild"},
          %{alias: "ON SEMICO"},
          %{alias: "MOT/ON SEMI"},
          %{alias: "ON SEMICONDUCTOR CORPORATION"},
          %{alias: "ON4"},
          %{alias: "ON SEMICONDUCTOR CORP"},
          %{alias: "Fairchild (ON Semiconductor)"},
          %{alias: "ON SEMICONDUCT"},
          %{alias: "onsemi / Fairchild"},
          %{alias: "ON-SEMI SCG"},
          %{alias: "ON SEMICONDUTOR"},
          %{alias: "ON Semiconductor Inc."},
          %{alias: "onsemiconductor"}
        ],
        display_flag: "US",
        homepage_url: "https://www.onsemi.com/",
        id: "278",
        is_distributorapi: false,
        is_verified: false,
        name: "onsemi",
        slug: "onsemi"
      },
      manufacturer_url:
        "https://octopart.com/opatz8j6/b1?t=ccBBR-ijHX32HBJJ6x2yN2AstyVV08GmYC-VClLff0tiIj_oC0zaM5IDPaEMLPGMLxYbC5U1ilQ9sfy1NId0Wx_5eTtyFc3MqG2e-mj28Mf1CgjOYnQoI6wolMwPalB0Ii_oKFh8F78AIndw52WziSvHJLlRZyEH0QOHKzpaWXhoTHqJDbU7oHt88Yjgeh033qjLZohlZ4XuJTcEslvUcyNACWTjfQ2gZ7-v7iJr8fF_e2OgjerxqWP6ZjM4mbs",
      mpn: "1N914",
      name: "onsemi 1N914",
      octopart_url: "https://octopart.com/1n914-onsemi-84323160",
      short_description: "Rectifier Diode, 1 Phase, 1 Element, 0.2A, 100V V(RRM), Silicon, DO-35",
      slug: "/1n914-onsemi-84323160",
      specs: [
        %{
          attribute: %{
            group: "Technical",
            name: "Average Rectified Current",
            shortname: "averagerectifiedcurrent"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %{
          attribute: %{group: "Technical", name: "Capacitance", shortname: "capacitance"},
          display_value: "4 pF",
          units: "pF",
          value: "4"
        },
        %{
          attribute: %{group: "Physical", name: "Case/Package", shortname: "case_package"},
          display_value: "Axial",
          units: "",
          value: "Axial"
        },
        %{
          attribute: %{group: "Technical", name: "Current Rating", shortname: "currentrating"},
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Element Configuration",
            shortname: "elementconfiguration"
          },
          display_value: "Single",
          units: "",
          value: "Single"
        },
        %{
          attribute: %{group: "Technical", name: "Forward Current", shortname: "forwardcurrent"},
          display_value: "10 mA",
          units: "mA",
          value: "10"
        },
        %{
          attribute: %{group: "Technical", name: "Forward Voltage", shortname: "forwardvoltage"},
          display_value: "1 V",
          units: "V",
          value: "1"
        },
        %{
          attribute: %{group: "Dimensions", name: "Height", shortname: "height"},
          display_value: "1.91 mm",
          units: "mm",
          value: "1.91"
        },
        %{
          attribute: %{group: "Compliance", name: "Lead Free", shortname: "leadfree"},
          display_value: "Lead Free",
          units: "",
          value: "Lead Free"
        },
        %{
          attribute: %{group: "Dimensions", name: "Length", shortname: "length"},
          display_value: "4.56 mm",
          units: "mm",
          value: "4.56"
        },
        %{
          attribute: %{
            group: "Supply Chain",
            name: "Lifecycle Status",
            shortname: "lifecyclestatus"
          },
          display_value: "Production (Last Updated: 1 year ago)",
          units: "",
          value: "Production"
        },
        %{
          attribute: %{
            group: "Supply Chain",
            name: "Manufacturer Lifecycle Status",
            shortname: "manufacturerlifecyclestatus"
          },
          display_value: "ACTIVE (Last Updated: 1 year ago)",
          units: "",
          value: "ACTIVE"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Forward Surge Current (Ifsm)",
            shortname: "maxforwardsurgecurrent_ifsm_"
          },
          display_value: "1 A",
          units: "A",
          value: "1"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Junction Temperature (Tj)",
            shortname: "maxjunctiontemperature"
          },
          display_value: "175 °C",
          units: "°C",
          value: "175"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Operating Temperature",
            shortname: "maxoperatingtemperature"
          },
          display_value: "175 °C",
          units: "°C",
          value: "175"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Power Dissipation",
            shortname: "maxpowerdissipation"
          },
          display_value: "500 mW",
          units: "mW",
          value: "500"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Repetitive Reverse Voltage (Vrrm)",
            shortname: "maxrepetitivereversevoltage_vrrm_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Reverse Voltage (DC)",
            shortname: "maxreversevoltage_dc_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Max Surge Current",
            shortname: "maxsurgecurrent"
          },
          display_value: "4 A",
          units: "A",
          value: "4"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Min Operating Temperature",
            shortname: "minoperatingtemperature"
          },
          display_value: "-65 °C",
          units: "°C",
          value: "-65"
        },
        %{
          attribute: %{group: "Physical", name: "Mount", shortname: "mount"},
          display_value: "Through Hole",
          units: "",
          value: "Through Hole"
        },
        %{
          attribute: %{group: "Physical", name: "Number of Pins", shortname: "numberofpins"},
          display_value: "2",
          units: "",
          value: "2"
        },
        %{
          attribute: %{group: "Technical", name: "Output Current", shortname: "outputcurrent"},
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %{
          attribute: %{group: "Technical", name: "Packaging", shortname: "packaging"},
          display_value: "Bulk",
          units: "",
          value: "Bulk"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Peak Non-Repetitive Surge Current",
            shortname: "peaknon_repetitivesurgecurrent"
          },
          display_value: "4 A",
          units: "A",
          value: "4"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Peak Reverse Current",
            shortname: "peakreversecurrent"
          },
          display_value: "5 µA",
          units: "µA",
          value: "5"
        },
        %{
          attribute: %{group: "Technical", name: "Polarity", shortname: "polarity"},
          display_value: "Standard",
          units: "",
          value: "Standard"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Power Dissipation",
            shortname: "powerdissipation"
          },
          display_value: "500 mW",
          units: "mW",
          value: "500"
        },
        %{
          attribute: %{
            group: "Compliance",
            name: "Radiation Hardening",
            shortname: "radiationhardening"
          },
          display_value: "No",
          units: "",
          value: "No"
        },
        %{
          attribute: %{group: "Compliance", name: "REACH SVHC", shortname: "reachsvhc"},
          display_value: "No SVHC",
          units: "",
          value: "No SVHC"
        },
        %{
          attribute: %{group: "Technical", name: "Recovery Time", shortname: "recoverytime"},
          display_value: "4 ns",
          units: "ns",
          value: "4"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Reverse Recovery Time",
            shortname: "reverserecoverytime"
          },
          display_value: "4 ns",
          units: "ns",
          value: "4"
        },
        %{
          attribute: %{group: "Technical", name: "Reverse Voltage", shortname: "reversevoltage"},
          display_value: "75 V",
          units: "V",
          value: "75"
        },
        %{
          attribute: %{group: "Compliance", name: "RoHS", shortname: "rohs"},
          display_value: "Compliant",
          units: "",
          value: "Compliant"
        },
        %{
          attribute: %{group: "Technical", name: "Schedule B", shortname: "scheduleB"},
          display_value: "8541100070, 8541100070|8541100070|8541100070|8541100070|8541100070",
          units: ", ",
          value: "8541100070, 8541100070|8541100070|8541100070|8541100070|8541100070"
        },
        %{
          attribute: %{
            group: "Technical",
            name: "Voltage Rating (DC)",
            shortname: "voltagerating_dc_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %{
          attribute: %{group: "Physical", name: "Weight", shortname: "weight"},
          display_value: "80 g",
          units: "g",
          value: "80"
        },
        %{
          attribute: %{group: "Dimensions", name: "Width", shortname: "width"},
          display_value: "1.91 mm",
          units: "mm",
          value: "1.91"
        }
      ],
      total_avail: 6_579_615
    }
end
