defmodule Tory.OctopartFixtures do
  alias Tory.Octopart.Api.PartResult
  alias Tory.Octopart.Api.PartResult.{Spec, Company}
  alias Tory.Octopart.Api.PartResult.Spec.Attribute

  @spec part_result_fixture() :: PartResult
  def part_result_fixture() do
    %PartResult{
      aka_mpns: ["1N914T50A", "1N914_T50A"],
      avg_avail: 7945,
      datasheet:
        "http://datasheet.octopart.com/1N914-T50A-ON-Semiconductor-datasheet-87793896.pdf",
      image: "https://sigma.octopart.com/146361809/image/ON-Semiconductor-1N914-T50A.jpg",
      generic_mpn: "1N914",
      id: "84602646",
      company: %Company{
        aliases: [
          "ON Semiconductor",
          "ONS",
          "ONSEMICON",
          "ON SEM",
          "ON SEMICONDUCTO",
          "ON SEMICONDUCTORS",
          "ONSEMIC",
          "ON SEMICONDU",
          "OSC",
          "ONSE",
          "SCG",
          "ON SEMICOND",
          "ON SEMICONDUCTOR COR",
          "ONSM",
          "ON Semiconductor / Fairchild",
          "ON SEMICO",
          "MOT/ON SEMI",
          "ON SEMICONDUCTOR CORPORATION",
          "ON4",
          "ON SEMICONDUCTOR CORP",
          "Fairchild (ON Semiconductor)",
          "ON SEMICONDUCT",
          "onsemi / Fairchild",
          "ON-SEMI SCG",
          "ON SEMICONDUTOR",
          "ON Semiconductor Inc.",
          "onsemiconductor"
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
        "https://octopart.com/opatz8j6/b1?t=0JSIh6WfB4DJrA9fLHnTluJdsGr-6vSMgqLk1lRzQUuWMMhwJK24k_xZyG28nmAp1xIfOlaYfD8rUHpoFJeAIWtM5mmBJN3vyEZxjB-pduiZ-RdjZR4vwJa2L6LCN1lcd7Ju7x7uexPr-la1_p3Tco5AK8rfZxnLT1cd3BkywNyi50PH4Z_kDw4oZmraYqoPpxSVpvsA0LLOCH3hxJ3wr9_w3euLLIzPZKOJFO0F7FSCXNN28jsjg5ipNtkeQJDs",
      mpn: "1N914-T50A",
      name: "onsemi 1N914-T50A",
      octopart_url: "https://octopart.com/1n914-t50a-onsemi-84602646",
      short_description: "Rectifier Diode Small Signal Switching 100V 0.3A 4ns 2-Pin DO-35 Ammo",
      slug: "/1n914-t50a-onsemi-84602646",
      specs: [
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Average Rectified Current",
            shortname: "averagerectifiedcurrent"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %Spec{
          attribute: %Attribute{group: "Technical", name: "Capacitance", shortname: "capacitance"},
          display_value: "4 pF",
          units: "pF",
          value: "4"
        },
        %Spec{
          attribute: %Attribute{
            group: "Physical",
            name: "Contact Plating",
            shortname: "contactplating"
          },
          display_value: "Tin",
          units: "",
          value: "Tin"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Current Rating",
            shortname: "currentrating"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Element Configuration",
            shortname: "elementconfiguration"
          },
          display_value: "Single",
          units: "",
          value: "Single"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Forward Current",
            shortname: "forwardcurrent"
          },
          display_value: "300 mA",
          units: "mA",
          value: "300"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Forward Voltage",
            shortname: "forwardvoltage"
          },
          display_value: "1 V",
          units: "V",
          value: "1"
        },
        %Spec{
          attribute: %Attribute{group: "Compliance", name: "Lead Free", shortname: "leadfree"},
          display_value: "Lead Free",
          units: "",
          value: "Lead Free"
        },
        %Spec{
          attribute: %Attribute{
            group: "Supply Chain",
            name: "Lifecycle Status",
            shortname: "lifecyclestatus"
          },
          display_value: "Production (Last Updated: 1 year ago)",
          units: "",
          value: "Production"
        },
        %Spec{
          attribute: %Attribute{
            group: "Supply Chain",
            name: "Manufacturer Lifecycle Status",
            shortname: "manufacturerlifecyclestatus"
          },
          display_value: "ACTIVE (Last Updated: 1 year ago)",
          units: "",
          value: "ACTIVE"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Max Operating Temperature",
            shortname: "maxoperatingtemperature"
          },
          display_value: "175 °C",
          units: "°C",
          value: "175"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Max Repetitive Reverse Voltage (Vrrm)",
            shortname: "maxrepetitivereversevoltage_vrrm_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Max Reverse Voltage (DC)",
            shortname: "maxreversevoltage_dc_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Max Surge Current",
            shortname: "maxsurgecurrent"
          },
          display_value: "4 A",
          units: "A",
          value: "4"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Min Operating Temperature",
            shortname: "minoperatingtemperature"
          },
          display_value: "-65 °C",
          units: "°C",
          value: "-65"
        },
        %Spec{
          attribute: %Attribute{group: "Physical", name: "Mount", shortname: "mount"},
          display_value: "Through Hole",
          units: "",
          value: "Through Hole"
        },
        %Spec{
          attribute: %Attribute{
            group: "Physical",
            name: "Number of Pins",
            shortname: "numberofpins"
          },
          display_value: "2",
          units: "",
          value: "2"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Output Current",
            shortname: "outputcurrent"
          },
          display_value: "200 mA",
          units: "mA",
          value: "200"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Peak Non-Repetitive Surge Current",
            shortname: "peaknon_repetitivesurgecurrent"
          },
          display_value: "4 A",
          units: "A",
          value: "4"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Peak Reverse Current",
            shortname: "peakreversecurrent"
          },
          display_value: "5 µA",
          units: "µA",
          value: "5"
        },
        %Spec{
          attribute: %Attribute{group: "Technical", name: "Polarity", shortname: "polarity"},
          display_value: "Standard",
          units: "",
          value: "Standard"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Power Dissipation",
            shortname: "powerdissipation"
          },
          display_value: "500 mW",
          units: "mW",
          value: "500"
        },
        %Spec{
          attribute: %Attribute{
            group: "Compliance",
            name: "Radiation Hardening",
            shortname: "radiationhardening"
          },
          display_value: "No",
          units: "",
          value: "No"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Recovery Time",
            shortname: "recoverytime"
          },
          display_value: "4 ns",
          units: "ns",
          value: "4"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Reverse Recovery Time",
            shortname: "reverserecoverytime"
          },
          display_value: "4 ns",
          units: "ns",
          value: "4"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Reverse Voltage",
            shortname: "reversevoltage"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Spec{
          attribute: %Attribute{group: "Compliance", name: "RoHS", shortname: "rohs"},
          display_value: "Compliant",
          units: "",
          value: "Compliant"
        },
        %Spec{
          attribute: %Attribute{
            group: "Technical",
            name: "Voltage Rating (DC)",
            shortname: "voltagerating_dc_"
          },
          display_value: "100 V",
          units: "V",
          value: "100"
        },
        %Spec{
          attribute: %Attribute{group: "Physical", name: "Weight", shortname: "weight"},
          display_value: "80 g",
          units: "g",
          value: "80"
        }
      ],
      total_avail: 1_120_334
    }
  end
end
