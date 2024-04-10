#!/bin/sh

DATE=$(date "+%Y%m%d" -d '1 day ago')

mkdir -p /data/mongo_dump/$DATE
/usr/bin/mongodump -u pangduck -p 'pangduck@!09' -o /data/mongo_dump/$DATE/
