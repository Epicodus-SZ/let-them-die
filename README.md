# Let Them Die

## How to backup the project database
1. From Bash type '$ pg_dump let_them_die > db_backup.sql'


## How to restore the project database

1. Run Postgres = 'Postgres'
2. Go into psql = 'psql'
3. Create your database = 'CREATE DATABASE let_them_die;'
4. Exit psql = '\q'
5. Load your database schema from the backup = 'psql let_them_die < db_backup.sql'
6. Go into psql = 'psql'
7. Create the test DB = 'CREATE DATABASE let_them_die_test WITH TEMPLATE let_them_die;'
