# The Virtual Machine Park

[![Build Status](https://travis-ci.org/fkrull/VM-Park.svg?branch=master)](https://travis-ci.org/fkrull/VM-Park)

This is my herd of virtual machines for testing purposes. These are (usually)
pristine installations of various desktop OS (mostly Linux). They are for my own
benefit and not necessarily applicable to other people's needs. Only tested with
VirtualBox.

## How to use
Run `vagrant status` to get an overview of all defined VMs. Then run

    vagrant up <VM name>

to create and provision the VM you want. All VMs are GUI-enabled, have
bidirectional shared clipboard turned on and mount the folder `~/Public`.

## Availability
The Linux/FOSS systems use publicly available base boxes and should work in any
environment. The Windows VMs are using custom base boxes; for Windows 7+ I use
boxes based on the [boxcutter](https://github.com/boxcutter/windows) templates,
so you might be able to reproduce them. Anything older is fully custom, though.

## Configuration
Certain settings can be configured by creating a `local_config.rb` file in the
repository root and setting configuration variables there. See
`local_config.rb.example` for a sample file. You can find the names and defaults
of all available configurable settings at the top of the `Vagrantfile`. The
`Vagrantfile`, rather than the sample, is authoritative.
