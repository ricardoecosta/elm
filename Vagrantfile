# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.provision "shell", inline: "sudo apt-get install -y node npm && sudo apt-get install -y nodejs-legacy"
  config.vm.provision "shell", inline: "sudo npm install -g elm"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
end
