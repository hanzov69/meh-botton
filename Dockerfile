FROM camilin87/node-cron:latest
MAINTAINER hanzov69 (Christian Sullivan)
RUN apt-get update &&\
    apt-get install -y libgtk-3-0 libgtk2.0-0 libgconf-2-4 \
    libasound2 libxtst6 libxss1 libnss3 xvfb
ENV TASK_SCHEDULE='*/5 * * * *'
COPY . /usr/src/app
WORKDIR /usr/src/app
RUN npm install
