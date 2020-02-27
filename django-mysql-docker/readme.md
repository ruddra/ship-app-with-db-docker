Django MySQL Docker
-------------------

This image is based on [mysql:8 image]().

## Commands to run

### Build
This is the command to build
```
docker build . -t django-mysql
```

### Run

This is the command to run
```
docker run -p 8000:8000 -t django-mysql
```