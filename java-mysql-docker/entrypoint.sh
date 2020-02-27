#!/bin/sh
/usr/local/bin/docker-entrypoint.sh "$@" & java -jar /src/runable.jar
