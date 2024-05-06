FROM apache/airflow:2.8.0
USER root
RUN apt update && apt -y install vim && apt install -y net-tools && apt -y install procps && apt install -y curl && apt clean 

USER airflow
COPY requirements.txt /opt/airflow/requirements.txt

RUN pip3 install --upgrade && pip3 install --ignore-installed -r /opt/airflow/requirements.txt && rm /opt/airflow/requirements.txt