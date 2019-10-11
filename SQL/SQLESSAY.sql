An inner join connects multiple tables together and selects the values from those tables that match one another. An outer join, which could be LEFT, RIGHT, or FULL OUTER will select values that match on multiple tables and also values which may only be present on one or select tables.

A key is a set of values that uniquely identify rows or columns of information within a table.  The PRIMARY KEY uniquely identifies information in the table, and the UNIQUE constraint ensures that the values are not identical.  A FOREIGN KEY is a field in the table that identifies information in another table.  Usually the foreign key is the primary key of the other table.  It's beneficial to use keys to ensure data does not lose its integrity when being used to show relations between tables.  It prevents incorrect data from being inserted into the table.

A natural key is a set of columns that already exist in a table and are uniquely identifiable. That column of values also relates with the resot of the columns in the table. An example might be a Social Security Number.  It's already a unique identifier for an individual.

A simple key is a single attribute for a column that uniquely identifies one row of information.
A secondary key is an alternative primary key, a key that could be used as primary but may as unique an identifier as another key in the table. When the primary key is chosen, the other keys in the table could be considered secondary.

A super key is a set of columns that uniquely defines a row. When one column is combined with another such as Social Security Number and Name, this is extremely unique in the sense that no person's first name and SSN should be the same.  SSN is a superkey, even if combined with last name or birth date, it should match a single unique row.

Referential Integrity refers to the accuracy and consistency of data within multiple tables that relate.
When relating multiple tables, foreign keys are used to reference primary keys on other tables and data between those tables needs to remain true.  If a foreign key is used, it needs to ensure that the primary key is valid when referencing the parent table.  

The WHERE clause is used to filter data from a result. HAVING clause is used to filter values from a group. 
The HAVING clause is also used when dealing with aggregate data such as AVG, SUM, COUNT.  WHERE clause does not associate with aggregate data.
