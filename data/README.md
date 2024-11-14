These files should be loaded into the respective material tables.
Do not change the order of the items as this will interfere with the
primary key column of the respective table.

Make sure to reset the identity column when updating the items. The
easiest way is to truncate the table and reload the file.

```SQL
TRUNCATE TABLE <tablename> RESTART IDENTITY;
```
