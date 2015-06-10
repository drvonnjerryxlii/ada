__you need to have data in the primary key table before you can use that as a foreign key anywhere else.__

* if you try to insert a foreign key value that doesn't exist in the related table, you'll get an error.

* if you try to insert a string into an integer field, you'll get an error.

* this helps maintain the integrity of the database.

### Vendor ###

key? | column name | data type
-----|-------------|----------
primary key | id | INT
- | name | TEXT
foreign key | market_id | INT

### Market ###

key? | column name | data type
-----|-------------|----------
primary key | id | INT
- | name | TEXT

### Sales ###

key? | column name | data type
-----|-------------|----------
primary key | id | INT
foreign key | vendor_id | INT
foreign key | product_id | INT
