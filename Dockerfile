FROM resin/rpi-raspbian:jessie

ENV TELEGRAF_VERSION 1.1.2
RUN  apt-get update \
  && apt-get install -y wget
RUN wget https://dl.influxdata.com/telegraf/releases/telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz && \
    tar xvfz telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz && \
    rm telegraf-${TELEGRAF_VERSION}_linux_armhf.tar.gz && \
    cp -r telegraf/* / && \
    rm -rf telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 8125/udp 8092/udp 8094

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
CMD ["telegraf"]
