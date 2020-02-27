Django PostgreSQL Docker
------------------------

This image is based on [postgres:12-alpine image]()

## Commands to run

### Build
This is the command to build
```
docker build . -t django-psql
```

### Run

This is the command to run
```
docker run -p 8000:8000 -t django-psql
```