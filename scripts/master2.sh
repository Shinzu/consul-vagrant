#!/bin/bash
sudo cat > /etc/consul/config.json << EOL
{
  "datacenter": "vagrant-dc",
  "data_dir": "/var/cache/consul",
  "log_level": "INFO",
  "node_name": "consul-master-2",
  "bind_addr": "0.0.0.0",
  "advertise_addr": "192.168.2.3",
  "domain": "consul.",
  "recursor": "8.8.8.8",
  "encrypt": "67yREDkFtrJ/h2joGY1kBA==",
  "start_join": ["192.168.2.2", "192.168.2.4"],
  "server": true
}
EOL
service consul stop
rm -rf /var/cache/consul/*
service consul start
