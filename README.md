# obs-environment
A collection of docker containers, configuration files and tools for obs

## Database
To start the database just type:

```docker-compose up -d```

This will start a mysql database on port 3306 and an adminer web interface on port 8081. A database named `obsdb` and a user named `admin` with the password `admin` will be created. If you want to add some initial data to the database, you can put `.sql` files into the initdb folder, which will be executed, when starting the database.

To stop the database use:
```docker-compose down```