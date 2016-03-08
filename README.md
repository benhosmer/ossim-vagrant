# OSSIM OMAR PostgreSQL Single Node Development
(Currently, this is just the runtime/binary pieces.  The full
development chain _could_ be installed in the future)

## Getting Started

### Initialize the git submodules
1. After cloning this repo, you'll need to update the submodules contained
in `sm-rbtcloud-com`.  From the top-level:
    - `$ git submodule update --init --recursive`

### Preparation
1. You'll need [Virtualbox](http://virtualbox.org)
2. You'll also need [Vagrant](http://vagrantup.com)

Optionally, you might find the Vagrant vb-guest plugin helpful. You can add
it with `$ vagrant plugin install vagrant-vbguest`. This keeps your guest
additions updated in the vagrant box when you start it.

After installing both of these, you're ready to start!

But wait, there's more!

Add `192.168.33.55 omar-single.rbtcloud.dev` to your /etc/hosts file if
you plan on accessing the deployed OMAR.  It is proxied to:

[http://omar-single.rbtcloud.dev/omar](http://omar-single.rbtcloud.dev/omar)

Add `192.168.33.56` to your `/etc/hosts` file for the ELK machine.

This proxies to [http://elk.rbtcloud.dev](http://elk.rbtcloud.dev)

### Starting the box(es)
This Vagrant setup uses [Vagrant Multi-Machine](https://www.vagrantup.com/docs/multi-machine/)

1. In this directory, use `$ vagrant up` to start the default omar-single node machine. 
2. In this directory, use `$ vagrant up elk` to start the ELK machine.

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

### Notes
You can ssh to the box itself using the standard `$ vagrant ssh` command which uses Vagrant's public/private key.

If you'd like to access the box through the hostname, the default vagrant password, which is `vagrant` will work too:

`$ ssh vagrant@omar-single.rbtcloud.dev` or using the ip `$ ssh vagrant@192.168.33.55` if you didn't modify your `/etc/hosts`

### OSSIM Only Without Access to sm-rbtcloud
The `sm-rbtcloud` repo contains proprietary company specific credentials and
houses our internal [SALT](http://saltstack.com) states for configuration of
a variety of software development projects.

If you're simply looking for a Vagrant-based OSSIM box, you can do the following
and be up and running quickly:

1. Ignore the submodule instructions from above. You don't need those to install
OSSIM.
2. Move the existing `Vagrantfile` in the repo to something else, ie `_Vagrantfile`.
3. Rename the `ossim-only-Vagrantfile` to `Vagrantfile`. 
4. `$ vagrant up` will install the dependencies you need as well as OSSIM itself.

