# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|


  # An OMAR/PostgreSQL Single Machine
  config.vm.define "omarsingle", primary: true do |omarsingle|
    omarsingle.vm.box = "bhosmer/centos6.6-minimal" 
    omarsingle.vm.hostname = "omar-single.rbtcloud.dev"
    omarsingle.vm.network "private_network", ip: "192.168.33.55"
    omarsingle.vm.provision :salt do |salt|
      salt.minion_config = "omar-single.minion"
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  # An Elastic Search, Logstash, Kibana Single Node Machine
  config.vm.define "elk", autostart: false do |elk|
    elk.vm.box = "bhosmer/centos6.6-minimal" 
    elk.vm.hostname = "elk.rbtcloud.dev"
    elk.vm.network "private_network", ip: "192.168.33.56"
    elk.vm.provision :salt do |salt|
      salt.minion_config = "elk.minion"
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  # A clean slate CentOS 6 Machine for experimenting and testing
  config.vm.define "base", autostart: false do |base|
    base.vm.box = "bhosmer/centos6.6-minimal" 
    base.vm.hostname = "base.rbtcloud.dev"
    base.vm.network "private_network", ip: "192.168.33.57"
  end
  
  # A clean slate CentOS 6 Machine for experimenting and testing
  config.vm.define "ossim", autostart: false do |ossim|
    ossim.vm.box = "bhosmer/centos6.6-minimal" 
    ossim.vm.hostname = "ossim-single.rbtcloud.dev"
    ossim.vm.network "private_network", ip: "192.168.33.58"
    ossim.provision "shell", path: "ossim-postup.sh"
  end
 
  # A single node geowave machine 
  config.vm.define "geowavesingle", autostart: false do |geowavesingle|
    geowavesingle.vm.box = "bhosmer/centos6.6-minimal" 
    geowavesingle.vm.hostname = "geowave-single.rbtcloud.dev"
    geowavesingle.vm.network "private_network", ip: "192.168.33.59"
    geowavesingle.vm.provision :salt do |salt|
      salt.minion_config = "geowave-single.minion"
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  # A single PostgreSQL machine
  config.vm.define "pgsqlsingle", autostart: false do |pgsqlsingle|
    pgsqlsingle.vm.box = "bhosmer/centos6.6-minimal"
    pgsqlsingle.vm.hostname = "pgsql-single.rbtcloud.dev"
    pgsqlsingle.vm.network "private_network", ip: "192.168.33.60"
    pgsqlsingle.vm.provision :salt do |salt|
      salt.minion_config = "pgsql-single.minion"
      salt.run_highstate = true
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

