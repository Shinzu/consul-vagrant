## Consul Vagrant

An easy way to get a cluster of Consul boxes to play with.

These boxes are built with [consul-cookbook](https://github.com/darron/consul-cookbook) and are available on Vagrant Cloud as [darron/consul](https://vagrantcloud.com/darron/consul).

Edit. i rebuild the boxes ,is available on Atlas under [shinzu/trusty64-consul](https://atlas.hashicorp.com/shinzu/trusty64-consul)

```
git clone
vagrant up server1
```
wait until server is finished with the bootstrap

Open another terminal or tab and launch the others:

```
vagrant up server2
vagrant up server3
vagrant up server4
vagrant up server5
```
and wait until all server are joined the cluster

Ctrl-c now the server1 and connect to the server
```
vagrant ssh server1
sudo -i
ps faux | grep consul
kill <consul pid>
start consul
```

You should have a fully working 3 master cluster(server{1..3}) with 2 members/clients(server{4..5}) at the end of this.

To access the built in web ui (runs only on the masters) that's new on 0.2.0 - you can add something similar to your `~/.ssh/config` file:

```
Host consulserver1
  Hostname 127.0.0.1
  Port 2222
  IdentityFile *path to repo*/consul-vagrant/.vagrant/machines/server1
  User vagrant
  LocalForward 8500 localhost:8500
```

Double check for Hostname, Port and Identity file - the [web ui looks great](http://shared.froese.org/2014/0505100045j18fz.jpg).

When you're done - just `vagrant destroy` to cleanup.
