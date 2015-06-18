- - -
> ## first board
- - -

* `Car < ActiveRecord::Base`  
  ..`belongs_to :owner` (.. is just for indentation)
   * `car = Car.new`
* `Owner < ActiveRecord::Base`
   * `owner = Owner.new`

relationships
* `has_one` - very restrictive, gets weird if you try to have more than one relationship
   * `has_one: car`
* `has_many`
* `belongs_to`
   * `belongs_to: owner`

cars | master template
-----|----------------
id|
make|
model|
color|
year|
mileage|
owner_id|

car | Kyna's car
----|-----
id | 1
make | honda
model | CRV
year | 2008
color | silver
mileage | 95008
owner_id | 10

owner | Kyna the owner
------|---------------
name | Kyna

- - -
> ## second board
- - -

shelves

...|...|...
---|---|---
...|...|...
...|...|...
...|...|...

sorting criteria:
* artist
* year of release
* record release
* condition

other data stored:
* record label
* country of origin
* number of LPs
* format

so he's working on a piece of software that will do this for him, because eventually the shelves fill up, and he needs to know which things need to be moved.

what do we need:
* Shelf object
   * each instance of Shelf is one of the blocks from the bookcase, but we don't need a specific bookcase to hold them yet.
* Record object
* ~~Artist object~~
   * should this be a separate object or an attribute of Record?
      * does it have any of its own attributes?
      * in our case: no. we don't care about anything else right now.

`Shelf < ActiveRecord::Base`  
..`has_many Records` (has_many 0, does not have to have )

shelves | data type
--------|-------------
id | integer primary key
position |
capacity | integer?

`Record < ActiveRecord::Base`  
..`belongs_to Shelf`
..`belongs_to RecordMaster`

records | data type
--------|----------
id | integer primary key
width | ??
shelf_id | integer foreign key
record_master_id | integer foreign key

`RecordMaster < ActiveRecord::Base`  
..`has_many Records`

record_masters | data type
---------------|----------
id | integer primary key
artist | text
title | text
year_of_release | ??
label | text
