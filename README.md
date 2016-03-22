# OC2S Vagrant Development

## Getting Started

### Initialize the git submodules
1. After cloning this repo, you'll need to update the submodules contained
in `sm-rbtcloud-com`.  From the top-level:
    - `$ git submodule sync`
    - `$ git submodule update --init --recursive`

### Preparation
1. You'll need [Virtualbox](http://virtualbox.org)
2. You'll also need [Vagrant](http://vagrantup.com)

Optionally, you might find the Vagrant vb-guest plugin helpful. You can add
it with `$ vagrant plugin install vagrant-vbguest`. This keeps your guest
additions updated in the vagrant box when you start it. The [vagrant-cachier](https://github.com/fgrehm/vagrant-cachier) is also quite useful and caches packages locally so you aren't downloading them over and over again. Install it with `$ vagrant plugin install vagrant-cachier` and add the following to your `~/.vagrant.d/Vagrantfile`: (If it doesn't exist, create a new one) This sets global configurations for all Vagrant boxes you use.)

    Vagrant.configure("2") do |config|
    config.vm.box = 'your-box'
    if Vagrant.has_plugin?("vagrant-cachier")
      # Configure cached packages to be shared between instances of the same base box.
      # More info on http://fgrehm.viewdocs.io/vagrant-cachier/usage
      config.cache.scope = :box
  
      # OPTIONAL: If you are using VirtualBox, you might want to use that to enable
      # NFS for shared folders. This is also very useful for vagrant-libvirt if you
      # want bi-directional sync
      config.cache.synced_folder_opts = {
        type: :nfs,
        # The nolock option can be useful for an NFSv3 client that wants to avoid the
        # NLM sideband protocol. Without this option, apt-get might hang if it tries
        # to lock files needed for /var/cache/* operations. All of this can be avoided
        # by using NFSv4 everywhere. Please note that the tcp option is not the default.
        mount_options: ['rw', 'vers=3', 'tcp', 'nolock']
      }
      # For more information please check http://docs.vagrantup.com/v2/synced-folders/basic_usage.html
      end
    end

After installing both of these, you're ready to start!

### Starting the box(es)
This Vagrant setup uses [Vagrant Multi-Machine](https://www.vagrantup.com/docs/multi-machine/)

1. In this directory, use `$ vagrant up` to start the default omar-single node machine. 
    - Settings and passwords are found in the `pillar/omaronesettings-dev.sls` pillar file.
2. In this directory, use `$ vagrant up elk` to start the ELK machine.
3. In this directory, use `$ vagrant up base` to start a clean CentOS 6 box for testing.
4. In this directory, use `$ vagrant up ossim` and see the OSSIM-Only Notes.
5. In this directory, use `$ vagrant up geowavesingle` for a single-machine geowave box. 
6. In this directory, use `$ vagrant up pgsqlsingle` for a PostgreSQL machine suitable for testing.
    - This applies the `postgresql.install` and `postgresql` states to install and configure
      a Single PostgreSQL machine. The passwords are available in the `pillar/omaronesettings-dev.sls` pillar file. 


This directory locally is shared with the vagrant machine at `/vagrant` and configured
for NFS with the SALT Provisioner.

You can now log in to you running instance with `$ vagrant ssh`

### Stopping the box (Equivalent to power off)
1. Use `$ vagrant halt`

#### Destroy the box
1. Use `$ vagrant destroy`
    - This wipes the box clean of everything may have done and resets it again. Don't
      worry about your code being deleted though. Since it is in the `/vagrant` directory
      it is shared with your local machine.

### Tips, Tricks and Troubleshooting
Often, your host's `/etc/exports` file will become corrupted, especially if your machine
powers down or is restarted while you have a box or boxes running. Vagrant isn't great
about telling you this is the problem. Deleting this file often solves the issues.

You can ssh to the box itself using the standard `$ vagrant ssh` command which uses Vagrant's public/private key.

If you'd like to access the box through the hostname, the default vagrant password, which is `vagrant` will work too:

`$ ssh vagrant@omar-single.rbtcloud.dev` or using the ip `$ ssh vagrant@192.168.33.55` if you didn't modify your `/etc/hosts`

### `/etc/hosts` File
You can copy and paste this into your `/etc/hosts/` and have all of the machines within
this Vagrant configuration accessible through a web browser, or SSH

    192.168.33.55 omar-single.rbtcloud.dev
    192.168.33.56 elk.rbtcloud.dev
    192.168.33.57 base.rbtcloud.dev
    192.168.33.58 ossim-single.rbtcloud.dev
    192.168.33.59 geowave-single.rbtcloud.dev
    192.168.33.60 pgsql-single.rbtcloud.dev

### OSSIM Only Without Access to sm-rbtcloud
The `sm-rbtcloud` repo contains proprietary company specific credentials and
houses our internal [SALT](http://saltstack.com) states for configuration of
a variety of software development projects.

If you're simply looking for a Vagrant-based OSSIM box, you can do the following
and be up and running quickly:

1. Ignore the submodule instructions from above. You don't need those to install
OSSIM.
2. `$ vagrant up ossim` will install the dependencies you need as well as OSSIM itself.

