This repository contains the third project for the Relational Database course on FreeCodeCamp. It includes a `.sql` dump file that can be loaded into a database for practice. To load the dump file, you can use the MySQL or PostgreSQL command line by running `mysql -u [username] -p [database_name] < salon.sql` or `psql -U [username] -d [database_name] -f salon.sql`. Alternatively, graphical tools can be used to import the file through their respective import options.

### Running the scripts

- `salon.sh` - This script is an interactive terminal that allows the user to book salon appointments and thus creates logs of these appointments in the database. Run it using: `./salon.sh` in a bash terminal and then follow the commands.
