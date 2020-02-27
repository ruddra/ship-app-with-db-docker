#!/bin/sh
/usr/local/bin/docker-entrypoint.sh "$@" & python /src/app.py