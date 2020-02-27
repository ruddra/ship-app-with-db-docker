Java MySQL Docker
-------------------

This image is based on [mysql:8 image]().

## Commands to run

First you need to put your jar file inside this directory.

### Build

This is the command to build
```
docker build . -t java-mysql
```

### Run

This is the command to run
```
docker run -p 8989:8989 -t java-mysql
```