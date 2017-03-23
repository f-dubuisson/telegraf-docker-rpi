# telegraf-docker-rpi [![Build Status](https://travis-ci.org/f-dubuisson/telegraf-docker-rpi.png)](https://travis-ci.org/f-dubuisson/telegraf-docker-rpi)
Docker images for Telegraf on Raspberry Pi. Tested on a raspi3/Jessie.

telegraf relies on a influxdb database so linking is required:

```
sudo docker run -p 8086:8086 -p 8083:8083 -d --name influxdb influxdb
sudo docker run --name telegraf --link influxdb:influxdb telegraf
```
