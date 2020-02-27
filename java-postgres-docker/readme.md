Java PostgreSQL Docker
-------------------

This image is based on [postgres:12-alpine image]().

## Commands to run

First you need to put your jar file inside this directory.

### Build

This is the command to build

```bash
docker build . -t java-psql
```

### Run

This is the command to run

```bash
docker run -p 8989:8989 -t java-psql
```