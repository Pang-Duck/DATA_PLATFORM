#!/bin/sh
# file-name: start_select.sh

DATA_PLATFORM_CLICKHOUSE="/data/PDATA_PLATFORM_platform/DATA_PLATFORM_CLICKHOUSE"
DATA_PLATFORM_AIRFLOW="/data/PDATA_PLATFORM_platform/DATA_PLATFORM_AIRFLOW"
DATA_PLATFORM_UTIL="/data/PDATA_PLATFORM_platform/DATA_PLATFORM_UTIL"
DATA_PLATFORM_WEB="/data/PDATA_PLATFORM_platform/DATA_PLATFORM_WEB"
DATA_PLATFORM_WEBDB="/data/PDATA_PLATFORM_platform/mongo_replica"

echo '------------------------------------------------------'
echo '                 1. DATA_PLATFORM_CLICKHOUSE                  '
echo '                 2. DATA_PLATFORM_AIRFLOW                     '
echo '                 3. DATA_PLATFORM_UTIL                        '
echo '                 4. DATA_PLATFORM_WEB                         '
echo '                 5. DATA_PLATFORM_WEBDB                       '
echo '                 6. ALL                               '
echo '------------------------------------------------------'

while true; do

  read -p " Enter the start package number: " number

  if [ $number -eq 1 ]; then

    cd $DATA_PLATFORM_CLICKHOUSE
    echo 'start deploying...'
    /usr/bin/docker stack deploy --compose-file clickhouse_server.yml data
    echo 'deploying done...'
    break

  elif [ $number -eq 2 ]; then

    cd $DATA_PLATFORM_AIRFLOW
    echo 'start deploying...'
    /usr/bin/docker stack deploy --compose-file docker-compose.yml airflow
    echo 'deploying done...'
    break

  elif [ $number -eq 3 ]; then

    cd $DATA_PLATFORM_UTIL
    echo 'start deploying...'
    /usr/bin/docker stack deploy --compose-file utils.yml util
    echo 'deploying done...'
    break

  elif [ $number -eq 4 ]; then

    echo 'start deploying...'
    /usr/bin/docker stack deploy --compose-file $DATA_PLATFORM_WEB/DATA_PLATFORM_WEB.yml data
    echo 'deploying done...'
    break

  elif [ $number -eq 5 ]; then

    echo 'start deploying...'
    /usr/bin/docker compose -f $DATA_PLATFORM_WEBDB/mongo_replica.yml up -d
    echo 'deploying done...'
    break

  elif [ $number -eq 6 ]; then

    echo 'start deploying...'
    /usr/bin/docker stack deploy --compose-file $DATA_PLATFORM_CLICKHOUSE/clickhouse_server.yml data
    /usr/bin/docker stack deploy --compose-file $DATA_PLATFORM_AIRFLOW/docker-compose.yml airflow
    /usr/bin/docker stack deploy --compose-file $DATA_PLATFORM_UTIL/utils.yml util
    /usr/bin/docker stack deploy --compose-file $DATA_PLATFORM_WEB/DATA_PLATFORM_WEB.yml util
    /usr/bin/docker compose -f $DATA_PLATFORM_WEBDB/mongo_replica.yml up -d
    echo 'deploying done...'
    break

  else
    echo ' Invalid input. Please enter a Package number. '

  fi
done
