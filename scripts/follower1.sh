#!/bin/bash
sudo echo -n > /etc/default/consul
sudo echo "DOCKER_OPTS='--dns 172.17.42.1 --dns 8.8.8.8 --dns-search service.consul --dns-search node.consul'" > /etc/default/docker
sudo stop docker
sleep 10
sudo start docker
sudo cat > /etc/consul/config.json << EOL
{
  "datacenter": "vagrant-dc",
  "data_dir": "/var/cache/consul",
  "log_level": "DEBUG",
  "node_name": "consul-follower-1",
  "bind_addr": "0.0.0.0",
  "addresses": {
    "http": "172.17.42.1",
    "dns": "172.17.42.1"
  },
  "ports": {
    "dns": 53
  },
  "advertise_addr": "192.168.2.5",
  "domain": "consul.",
  "recursor": "8.8.8.8",
  "encrypt": "67yREDkFtrJ/h2joGY1kBA==",
  "start_join": ["192.168.2.2", "192.168.2.3", "192.168.2.4"]
}
EOL
service consul stop
rm -rf /var/cache/consul/*
service consul start
#docker run -d -v /var/run/docker.sock:/tmp/docker.sock -h $HOSTNAME --name regis gliderlabs/registrator:master -ip 192.168.2.5 consul://192.168.2.5:8500
#docker run -d --name redis.0 -p 10000:6379 dockerfile/redis
