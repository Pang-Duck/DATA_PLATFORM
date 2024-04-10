FROM python:3.10.12

RUN apt update && apt install -y cron && apt install -y vim
RUN mkdir -p /home/pangduck

COPY healthchecker.py /home/pangduck
COPY gpu_util_custom.py /home/pangduck
COPY requirements.txt .
COPY entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh
RUN pip install -r requirements.txt

WORKDIR /home/pangduck
ENTRYPOINT ["/bin/sh", "/entrypoint.sh"]





