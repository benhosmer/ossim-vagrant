# OSSIM OMAR PostgreSQL Single Node Development
(Currently, this is just the runtime/binary pieces.  The full
development chain _could_ be installed in the future)

## Getting Started

### Initialize the git submodules
1. After cloning this repo, you'll need to update the submodules contained
in `sm-rbtcloud-com`:
    - `$ git submodule init`
    - `$ git submodule update`

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

### Starting the box

1. In this directory, use `$ vagrant up` to start the machine.

This directory locally is shared with the vagrant machine at `/vagrant`

You can now log in to you running instance with `$ vagrant ssh`

### Stopping the box (Equivalent to power off)
1. Use `$ vagrant halt`

#### Destroy the box
1. Use `$ vagrant destroy`
    - This wipes the box clean of everything may have done and resets it again. Don't 
      worry about your code being deleted though. Since it is in the `/vagrant` directory
      it is shared with your local machine.

### Notes
Even though you have access to the hostname - SSH through it won't work
unless you create a new user access, and define a password.  The default
'vagrant' user is access via a ssh-key - handled by the `vagrant ssh`
command.
