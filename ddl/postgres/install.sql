-- change it to any other schema name, if necessary
SET SCHEMA 'public';
\i 01_add_tables.sql;
\i 02_add_constraints.sql;
\i 03_add_extra_constraints.sql;