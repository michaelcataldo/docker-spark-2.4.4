FROM ubuntu:latest

ENV SPARK_HOME=/spark-2.4.4

RUN set -ex \
    && apt-get update -yqq \
    && apt-get upgrade -yqq \
    && apt-get install -yqq --no-install-recommends \
        wget \
        default-jre \
        python3 \
    && wget https://archive.apache.org/dist/spark/spark-2.4.4/spark-2.4.4-bin-hadoop2.7.tgz \
    && tar -xvzf spark-2.4.4-bin-hadoop2.7.tgz \
    && mv spark-2.4.4-bin-hadoop2.7 ${SPARK_HOME} \
    && rm spark-2.4.4-bin-hadoop2.7.tgz

COPY scripts/entrypoint.sh /entrypoint.sh

EXPOSE 8080 7077 6066

ENTRYPOINT [ "/entrypoint.sh" ]