# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  # An OMAR/PostgreSQL Single Machine
  config.vm.define "omarsingle" do |omarsingle|
    omarsingle.vm.box = "bhosmer/centos6.6-minimal" 
    omarsingle.vm.hostname = "omar-single.rbtcloud.dev"
    omarsingle.vm.network "private_network", ip: "192.168.33.55"
    omarsingle.vm.provision :salt do |salt|
      salt.minion_config = "omar-single.minion"
      salt.run_highstate = false
      #salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  config.vm.synced_folder ".", "/vagrant", type: "nfs"
  config.vm.synced_folder "sm-rbtcloud-com/salt/", "/srv/salt", type: "nfs"
  config.vm.synced_folder "sm-rbtcloud-com/pillar/", "/srv/pillar", type: "nfs"
  config.vm.synced_folder "sm-rbtcloud-com/formulas/", "/srv/formulas", type: "nfs"
  config.vm.synced_folder "sm-rbtcloud-com/reactor/", "/srv/reactor", type: "nfs"
  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
  end
end
