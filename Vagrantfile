# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

  config.vm.box = "centos/7"

  config.ssh.insert_key = false

  #Re-build the Shibboleth SP with FastCGI support
  config.vm.provision :shell, :path => "rebuild.sh"

  config.vm.provider :virtualbox do |vb|
    vb.name = "vagrant-shibboleth-sp-rebuild"
    vb.customize ["modifyvm", :id, "--cpus", "2"]
    vb.customize ["modifyvm", :id, "--memory", "2048"]
  end

end
