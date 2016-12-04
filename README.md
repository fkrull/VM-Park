# The Virtual Machine Park
This is my herd of virtual machines for testing purposes. These are mostly
pristine installations of various desktop OS (mostly Linux). They are for my own
benefit and not necessarily applicable to other people's needs. Only tested with
VirtualBox.

## How to use
Run `vagrant status` to get an overview of all defined VMs. Then run

    vagrant up <VM name>
    vagrant reload <VM name>

to first create and provision the VM, then reboot it so all the changes take.
All VMs are GUI-enabled and have bidirectional shared clipboard turned on.

## Availability
The Linux/FOSS systems use base boxes from
[vagrantcloud.com](https://vagrantcloud.com) as far as possible. The Windows VMs
may also be custom base boxes; those aren't going to be very useful to anyone
but me.

## Configuration
Certain settings can be configured by creating a `local_config.rb` file in the
repository root and setting configuration variables there. See
`local_config.rb.example` for a sample file. You can find the names and defaults
of all available configurable settings at the top of the `Vagrantfile`. In
general, the `Vagrantfile`, rather than the sample, is authoritative.
