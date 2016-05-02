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
    elk.vm.box = "bhosmer/centos7-minimal"
    elk.vm.hostname = "elk.rbtcloud.dev"
    elk.vm.network "private_network", ip: "192.168.33.56"
    elk.vm.provision :salt do |salt|
      salt.minion_config = "elk.minion"
      salt.run_highstate = true
      salt.log_level = "all"
    end
  end

  # A clean slate CentOS 6 Machine for experimenting and testing
  config.vm.define "base6", autostart: false do |base6|
    base6.vm.box = "bhosmer/centos6.6-minimal" 
    base6.vm.hostname = "base6.rbtcloud.dev"
    base6.vm.network "private_network", ip: "192.168.33.57"
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

  # A clean slate CentOS 7 Machine for experimenting and testing
  config.vm.define "base7", autostart: false do |base7|
    base7.vm.box = "bhosmer/centos7-minimal" 
    base7.vm.hostname = "base7.rbtcloud.dev"
    base7.vm.network "private_network", ip: "192.168.33.61"
  end

  # A clean RHEL 7 Machine for experimenting and testing
  # To do any yum activities, you need a free RedHat Developer subscription
  # See http://developers.redhat.com/products/rhel/get-started/
  config.vm.define "rhel7", autostart: false do |rhel7|
    if Vagrant.has_plugin?('vagrant-registration')
      config.registration.username = 'YOURREDHATUSERNAME'
      config.registration.password = 'YOURREDHATPASSWORD'
    end
    rhel7.vm.box = "https://s3-us-west-2.amazonaws.com/otd-vagrant-boxes/rhel7-minimal.box"
    rhel7.vm.hostname = "rhel7.rbtcloud.dev"
    rhel7.vm.network "private_network", ip: "192.168.33.62"
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

