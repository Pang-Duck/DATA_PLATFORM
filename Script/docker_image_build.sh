#!/bin/bash

Airflow_image_build() {
    docker build -t pangduck/tensorflow_gpu:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_AIRFLOW/Airflow_worker/tensorflowGPU/
    docker build -t pangduck/tensorflow_cpu:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_AIRFLOW/Airflow_worker/tensorflowNonGpu/
    docker build -t pangduck/torch:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_AIRFLOW/Airflow_worker/torch/
    docker build -t pangduck/airflow:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_AIRFLOW/
}

Clickhouse_image_build() {
    docker build -t pangduck/clickhouse-server:23.4.2.11 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_CLICKHOUSE/clickhouse/
    docker build -t pangduck/tabix:latest /data/PDATA_PLATFORM_platform/DATA_PLATFORM_CLICKHOUSE/tabix/
}

Util_image_build() {
    docker pull portainer/portainer:latest
    docker build -t pangduck/jupyterlab:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_UTIL/Jupyterlab/
    docker build -t pangduck/health_check:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_UTIL/Health_Check/
    docker build -t pangduck/health_check_alert:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_UTIL/Health_Check_Alert/
}

Webdb_image_build() {
    docker build -t pangduck/mongo:6.0 /data/PDATA_PLATFORM_platform/mongo_replica/
}

Webserver_image_build() {
    docker build -t pangduck/nginx:1.0 /data/PDATA_PLATFORM_platform/DATA_PLATFORM_WEB/
}

echo '------------------------------------------------------'
echo '                 1. Airflow image build               '
echo '                 2. Clickhouse image build            '
echo '                 3. UTIL image build                  '
echo '                 4. Webdb image build                 '
echo '                 5. Webserver image build             '
echo '                 6. ALL                               '
echo '------------------------------------------------------'

while true; do

    read -p " Enter the start image number: " number

    if [ $number -eq 1 ]; then

        echo 'start build...'
        Airflow_image_build
        echo 'build complete...'
        break

    elif [ $number -eq 2 ]; then

        echo 'start build...'
        Clickhouse_image_build
        echo 'build complete...'
        break

    elif [ $number -eq 3 ]; then

        echo 'start build...'
        Util_image_build
        echo 'build complete...'
        break

    elif [ $number -eq 4 ]; then

        echo 'start build...'
        Webdb_image_build
        echo 'build complete...'
        break

    elif [ $number -eq 5 ]; then

        echo 'start build...'
        Webserver_image_build
        echo 'build complete...'
        break

    elif [ $number -eq 6 ]; then

        echo 'start build...'
        Airflow_image_build
        Clickhouse_image_build
        Util_image_build
        Webdb_image_build
        Webserver_image_build
        echo 'build complete...'
        break

    else
        echo ' Invalid input. Please enter a image number. '

    fi
done
