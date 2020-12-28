# obs-environment
A collection of docker containers, configuration files and tools for obs

## Database
To start the database just type:

```docker-compose up -d```

This will start a mysql database on port 3306 and an adminer web interface on port 8081. A database named `obsdb` and a user named `admin` with the password `admin` will be created. If you want to add some initial data to the database, you can put `.sql` files into the initdb folder, which will be executed, when starting the database.

To stop the database use:
```docker-compose down```

## Building
The qt version used is `5.12.2`. The docker image containing the build environment can be build from the dockerfiles in `Dockerfiles`. Alternativly there are prebuild images available on [dockerhub](https://hub.docker.com/repository/docker/madmanfred/obs-environment).

To run qmake in the docker container:
```docker run --rm -it -v $(pwd):/src madmanfred/obs-environment qmake```
```docker run --rm -it -v $(pwd):/src madmanfred/obs-environment make```

The generated binary will be statically linked against the qt libraries, but you still need to supply the dynamic libraries for mariadb/mysql.