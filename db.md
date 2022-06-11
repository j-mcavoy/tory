Inventory

- Part

  - mpn
  - manufacturer -> Manufacturer
  - datasheet
  - barcode
  - octopart_uid
  - generic part

- Location

  - name
  - description

Generic

- ## GenericPart

Shopping

- Distributors

  - name
  - website
  - logo

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
