ARG POSTGRES_VERSION
FROM postgres:$POSTGRES_VERSION

RUN apt-get update && \
apt-get install -y git make gcc

RUN apt-get update && apt-get install unzip && apt-get --assume-yes install build-essential && apt-get --assume-yes install postgresql-server-dev-11 && apt-get install  -y wget \
&& wget https://github.com/pgpartman/pg_partman/archive/refs/tags/v4.7.4.zip -O 4.7.4.zip \
&& unzip 4.7.4.zip \
&& cd /pg_partman-4.7.4 && pwd && make NO_BGW=1 install


RUN apt-get update &&  \ 
  apt-get -y install postgresql-15-cron && \ 
  apt-get clean \ 
  && rm -rf /var/lib/apt/lists/*

  