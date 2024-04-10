#!/bin/sh
# file-name: start_select.sh

DATA_PLATFORM_CLICKHOUSE=/data/DATA_PLATFORM_CLICKHOUSE
DATA_PLATFORM_AIRFLOW=/data/DATA_PLATFORM_AIRFLOW
DATA_PLATFORM_UTIL=/data/DATA_PLATFORM_UTIL
echo '------------------------------------------------------'
echo '                 1. DATA_PLATFORM_CLICKHOUSE                  '
echo '                 2. DATA_PLATFORM_AIRFLOW                     '
echo '                 3. DATA_PLATFORM_UTIL                        '
echo '                 4. ALL                               '
echo '------------------------------------------------------'

while true; do

        read -p " Enter the stop package number: " number

        if [ $number -eq 1 ]; then

                cd $DATA_PLATFORM_CLICKHOUSE
                echo 'Start deleting...'
                /usr/bin/docker stack rm data
                echo 'Deletion completed...'
                break

        elif [ $number -eq 2 ]; then

                cd $DATA_PLATFORM_AIRFLOW
                echo 'Start deleting...'
                /usr/bin/docker-compose down
                echo 'Deletion completed...'
                break
        elif [ $number -eq 3 ]; then

                cd $DATA_PLATFORM_UTIL
                echo 'Start deleting...'
                /usr/bin/docker stack rm util
                echo 'Deletion completed...'
                break
        elif [ $number -eq 4 ]; then

                echo 'Start deleting...'
                /usr/bin/docker stack rm data
                /usr/bin/docker-compose -f $DATA_PLATFORM_AIRFLOW/docker-compose.yml down
                /usr/bin/docker stack rm util
                echo 'Deletion completed...'
                break
        else
                echo ' Invalid input. Please enter a Package number. '

        fi
done
