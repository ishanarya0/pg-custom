ARG POSTGRES_VERSION
ARG PARTMAN_VERSION
FROM postgres:$POSTGRES_VERSION
RUN apt-get update && apt-get install unzip && apt-get --assume-yes install build-essential && apt-get --assume-yes install postgresql-server-dev-11 && apt-get install  -y wget \
&& wget https://github.com/keithf4/pg_partman/archive/v$PARTMAN_VERSION.zip -O $PARTMAN_VERSION.zip \
&& unzip $PARTMAN_VERSION.zip \
&& cd /pg_partman-$PARTMAN_VERSION && pwd && make install && make NO_BGW=1 install