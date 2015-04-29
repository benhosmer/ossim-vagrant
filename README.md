# OSSIM OMAR PostgreSQL Single Node Development

## Getting Started

### Initialize the git submodules
1. After cloning this repo, you'll need to update the submodules contained
in `sm-rbtcloud`:
    - `$ git submodule init`
    - `$ git submodule update`

### Preparation
1. You'll need [Virtualbox](http://virtualbox.org)
2. You'll also need [Vagrant](http://vagrantup.com)

Optionally, you might find the Vagrant vb-guest plugin helpful. You can add
it with `$ vagrant plugin install vagrant-vbguest`. This keeps your guest
additions updated in the vagrant box when you start it.

After installing both of these, you're ready to start!

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

