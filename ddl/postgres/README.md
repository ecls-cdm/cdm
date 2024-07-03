# Installation instructions

1. If you have any other schema than 'public' you have to specify it in
   the `install.sql` file before loading the data.
2. Load the `install.sql` file using `psql`or any other tool of your choice.

      ```
      postgres@myserver:/../ddl/postgres$ psql -d <mydatabase> -f install.sql -v ON_ERROR_STOP=1
      ```

Alternatively load the files separately.
