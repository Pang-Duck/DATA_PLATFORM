#!/bin/sh

touch /etc/cron.d/health_check_alert
touch /etc/cron.d/health_check_alert_log
echo "* * * * * /usr/local/bin/python3 /home/pangduck/healthchecker_alert.py >> /home/pangduck/healthchecker_alert.log 2>&1" >>/etc/cron.d/health_check_alert
echo "0 0 15 */2 * /usr/bin/rm -rf /home/pangduck/healthchecker_alert.log" >>/etc/cron.d/health_check_alert
chmod 644 /etc/cron.d/health_check_alert
crontab /etc/cron.d/health_check_alert
cron -f
