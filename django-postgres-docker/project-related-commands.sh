#!/bin/sh
sleep 1m
python /src/dummy/manage.py migrate && python /src/dummy/manage.py runserver 0.0.0.0:8000