#!/bin/sh

if [ ! -d prometheus-2.0.0.linux-amd64 ]; then
    wget -q https://github.com/prometheus/prometheus/releases/download/v2.0.0/prometheus-2.0.0.linux-amd64.tar.gz
    tar zxf prometheus-2.0.0.linux-amd64.tar.gz
fi

chown -R ubuntu:ubuntu prometheus-*

if [ ! -d /usr/local/go ]; then
    wget -q https://dl.google.com/go/go1.9.2.linux-amd64.tar.gz
    tar -C /usr/local -xzf go1.9.2.linux-amd64.tar.gz
fi

grep -q /usr/local/go/bin ~ubuntu/.bashrc
if [ $? != 0 ]; then
     echo 'export PATH=$PATH:/usr/local/go/bin' >> ~ubuntu/.bashrc
fi

cp /vagrant/prometheus.yml prometheus-2.0.0.linux-amd64

if [ ! -f grafana_4.6.3_amd64.deb ]; then
  wget -q https://s3-us-west-2.amazonaws.com/grafana-releases/release/grafana_4.6.3_amd64.deb
  apt-get install -y adduser libfontconfig
  dpkg -i grafana_4.6.3_amd64.deb
  systemctl daemon-reload
  systemctl enable grafana-server
  systemctl start grafana-server
fi

