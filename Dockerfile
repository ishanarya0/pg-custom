ARG POSTGRES_VERSION
FROM postgres:$POSTGRES_VERSION

RUN apt-get update && \
apt-get install -y git make gcc

RUN git clone https://github.com/pgpartman/pg_partman --branch 4.7.1
RUN cd pg_partman && make NO_BGW=1 install

RUN apt-get update &&  \ 
  apt-get -y install postgresql-15-cron && \ 
  apt-get clean \ 
  && rm -rf /var/lib/apt/lists/*
