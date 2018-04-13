# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # two boxes configured separately, using a loop does not handle the assignment of ip addresses properly. To be looked at.
  config.vm.define "web1" do |web|
    web.vm.box="ubuntu/trusty64"
    web.vm.network "private_network", ip: "10.0.0.11"
    web.vm.provision "shell" do |shell|
      shell.args = "1"
      shell.path = "web.sh"
    end
  end
  config.vm.define "web2" do |web|
      web.vm.box="ubuntu/trusty64"
      web.vm.network "private_network", ip: "10.0.0.12"
      web.vm.provision "shell" do |shell|
        shell.args = "2"
        shell.path = "web.sh"
      end
    end
  config.vm.define "load_balancer" do |balancer|
    balancer.vm.box="ubuntu/trusty64"
    balancer.vm.network "forwarded_port", guest: 80, host: 8080
    balancer.vm.network "private_network", ip: "10.0.0.10"
    balancer.vm.provision "shell" do |shell|
      shell.path = "balancer.sh"
    end
  end
end
