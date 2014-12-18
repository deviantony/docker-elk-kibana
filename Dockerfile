FROM dockerfile/java:oracle-java7

ENV DEBIAN_FRONTEND noninteractive 

RUN apt-get update && \
    apt-get install -y ca-certificates wget

RUN cd /opt && \
    wget https://download.elasticsearch.org/kibana/kibana/kibana-4.0.0-BETA3.tar.gz && \
    tar -xzvf ./kibana-4.0.0-BETA3.tar.gz && \
    mv kibana-4.0.0-BETA3 kibana && \
    rm kibana-4.0.0-BETA3.tar.gz

ADD conf/kibana.yml /opt/kibana/config/kibana.yml

ENTRYPOINT ["/opt/kibana/bin/kibana"]
