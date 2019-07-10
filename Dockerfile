FROM ubuntu:16.04
MAINTAINER hanzov69 (Christian Sullivan)
RUN apt-get update &&\
    apt-get install -y libgtk-3-0 libgtk2.0-0 libgconf-2-4 \
    libasound2 libxtst6 libxss1 libnss3 xvfb cron logrotate curl
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash -
RUN apt-get install -y nodejs
RUN mkdir -p /usr/src/app
COPY ./templates/log-rotation /etc/logrotate.d/my-cron-job
COPY ./templates/crontab /tmp/crontab
RUN touch /etc/cron.d/my-cron-job
RUN chmod 0644 /etc/cron.d/my-cron-job
RUN touch /var/log/cron.log


COPY ./templates/setupCron.sh /tmp/setupCron.sh
RUN chmod +x /tmp/setupCron.sh

CMD ["/tmp/setupCron.sh"]
# NOTE- there is a space at the end of the below string, do not omit!
# This will default to running every 2 hours
ENV TASK_SCHEDULE='0 */2 * * * '

COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install
