#!/bin/sh

cd /home/pangduck
/usr/local/bin/python /usr/local/bin/uvicorn healthchecker:app --reload --host=0.0.0.0 --port=7972
