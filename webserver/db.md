# schema

## Inventory

### Part

- mpn:string
- description
- datasheet:string
- manufacturer:id -> manufacturer
- distributor
- barcode
- octopart_id
- price_usd:integer (us cents)

### Location

- name:notnull,unique
- description

### Manufacturer

- name:unique
- website

### Distributor

- name:unique
- website

### Attribute

- attribute:not null, unique
- value:string nullable
- unit:string nullable

### Part2Attributes

- part:id -> Part
- attribute:id -> Attribute
  unique_index(part, attribute)

### Location2Part

- location:id -> Location
- part:id -> Part
- quantity:integer
  unique_index(part, location)

## User

### User (genrated via credentials)

- username:unique
- firstname
- lastname
- password (virtual)
- password_hash

### User Group

- name:unique

### Permission

- name:unique
- id:integer:unique

### User2Permission

- user:user -> User
- permission:permission -> Permission
  unique_index(user, permission)

### UserGroup2Permission

- user:user -> User
- permission:permission -> Permission
  unique_index(user_group, permission)
