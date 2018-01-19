#!/bin/sh

if [ ! -d node_exporter-0.15.2.linux-amd64 ]; then
    wget -q https://github.com/prometheus/node_exporter/releases/download/v0.15.2/node_exporter-0.15.2.linux-amd64.tar.gz
    tar zxf node_exporter-0.15.2.linux-amd64.tar.gz
fi
