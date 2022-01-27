FROM alpine:3.9

COPY prometheus-jmx-config.yaml /opt/prometheus-jmx-config.yaml

WORKDIR /opt

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories

RUN apk add --no-cache wget \
    && wget https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_javaagent/0.16.1/jmx_prometheus_javaagent-0.16.1.jar

VOLUME [ "/tmp/agent" ]

CMD cp -vR /opt/* /tmp/agent