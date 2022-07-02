Inventory

- Part

  - mpn-id: MPN
  - octopart_id: id
  - name: String!
  - generic_mpn_id: MPN
  - manufacturer: Company!
  - manufacturer_url: String
  - free_sample_url: String
  - document_collections: [DocumentCollection!]!
  - short_description: String!
  - descriptions: [Description!]!
  - images: [Image!]!
  - specs: [Spec!]!
  - slug: String!
  - octopart_url: String!
    %%% - similar_parts: [Part!]!
  - category: Category
  - series: PartSeries
  - best_image: Image
  - best_datasheet: Document
    %%% - reference_designs: [ReferenceDesign!]!
  - cad_request_url: String
  - median_price_1000: PricePoint
  - total_avail: Int!
  - avg_avail: Float!
  - sellers(
  - include_brokers: Boolean! = false
  - authorized_only: Boolean! = false
  - ): [PartSeller!]!
  - estimated_factory_lead_days: Int
  - aka_mpns: [String!]!

- Spec
- display_value
- attribute

- Attribute

- Company

  - id: ID!
  - name: String!
  - aliases: [String!]!
  - display_flag: String
  - homepage_url: String
  - slug: String!
  - is_verified: Boolean!
  - is_distributorapi: Boolean!

- CompanyAliases

  - name
  - company_id: Company

- PartSeller

  - company: Company!
  - country: String
    %%%- offers: [Offer!]!
  - is_authorized: Boolean!
  - is_broker: Boolean!
  - is_rfq: Boolean!
    %%%- ships_to_countries: [Country!]!

- MPN

  - name
  - part_id: Part

- Location

  - name
  - description

Generic

- ## GenericPart

Shopping

- Prices
  - Distributor
  - Part

Stock

- LocationParts
  - location
  - part
  - count: unsigned int

Meta

- PartParameters

  - part
  - parameter

- Parameter
  - name not null
  - value (optional)

Security

- Permission

  - object type
  - object id
  - user id
  - group id
  - permitted (bool)

- Object types
  - name

Accounts

- User

- Group

  - name

- GroupMember
  - group id
  - user id
