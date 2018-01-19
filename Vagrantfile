# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  config.vm.define :prometheus do |c|
    c.vm.box = "ubuntu/xenial64"
    c.vm.provision :shell, path: "prometheus.sh"
    c.vm.network "private_network", ip: "192.168.100.100"
  end

  config.vm.define :node001 do |c|
    c.vm.box = "ubuntu/xenial64"
    c.vm.provision :shell, path: "node.sh"
    c.vm.network "private_network", ip: "192.168.100.101"
  end

  config.vm.define :node002 do |c|
    c.vm.box = "ubuntu/xenial64"
    c.vm.provision :shell, path: "node.sh"
    c.vm.network "private_network", ip: "192.168.100.102"
  end

end

