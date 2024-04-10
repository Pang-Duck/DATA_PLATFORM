#/bin/bash

find /xdb/csvfile -name "*" -mtime +6 -exec rm -f {} \;
