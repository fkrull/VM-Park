# -*- mode: ruby -*-
# vi: set ft=ruby :


begin
  require_relative "local_config"
rescue LoadError
  # Configurable settings.

  # Number of CPUs per VM.
  Cpus = 2
  # Amount of memory.
  Memory = 2048
  # Amount of video memory.
  VRAM = 128
  # Enable/disable 3D acceleration support.
  Accelerate3D = true
  # Path to a "public" directory that's mounted at /Public.
  PublicDir = File.expand_path("~/Public")
  # Environment for the provisioning scripts.
  Env = {
    # Keyboard layout.
    "KEYMAP": "de",
    # Timezone to set in the VMs.
    "TIMEZONE": "Europe/Berlin"
  }
end


require_relative "VMParkHelper"


Vagrant.configure("2") do |config|
  def config.define_park_vm(name, &block)
    _define_park_vm(self, name, block)
  end


  config.vm.synced_folder PublicDir, "/Public", :mount_options => ["ro"]

  config.vm.provider "virtualbox" do |vb|
     vb.memory = Memory
     vb.cpus = Cpus
     vb.gui = true
     vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
     vb.customize ["modifyvm", :id, "--vram", VRAM]
     vb.customize ["modifyvm", :id, "--accelerate3d", Accelerate3D ? "on" : "off"]
  end


  # Ubuntu
  config.define_park_vm "Ubuntu 12.04 (32 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1204-i386"
    box.provision_park_vm [
      "keymap-xorgconf.sh",
      "timezone-debian.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.define_park_vm "Ubuntu 12.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1204-desktop"
    box.provision_park_vm [
      "keymap-xorgconf.sh",
      "timezone-debian.sh",
    ]
  end

  config.define_park_vm "Ubuntu 14.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1404-desktop"
    box.provision_park_vm [
      "keymap-localectl.sh",
      "timezone-debian.sh",
    ]
  end

  config.define_park_vm "Ubuntu 16.04 (32 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-i386"
    box.provision_park_vm [
      "keymap-localectl.sh",
      "timezone-debian.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.define_park_vm "Ubuntu 16.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-desktop"
    box.provision_park_vm [
      "keymap-localectl.sh",
      "timezone-debian.sh",
    ]
  end


  # Debian
  config.define_park_vm "Debian 7 (64 bit)" do |box|
    box.vm.box = "boxcutter/debian7"
    box.provision_park_vm [
      "keymap-xorgconf.sh",
      "timezone-debian.sh",
      "install-desktop-debian7.sh",
      "autologin-gdm3.sh",
    ]
  end

  config.define_park_vm "Debian 8 (64 bit)" do |box|
    box.vm.box = "boxcutter/debian8-desktop"
    box.provision_park_vm [
      "keymap-localectl.sh",
      "timezone-debian.sh",
    ]
  end


  # Fedora
  config.define_park_vm "Fedora 23 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora23"
    box.provision_park_vm [
      "install-desktop-fedora.sh",
      "enable-desktop-systemd.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
    box.vm.provision "shell", inline: "systemctl enable sshd.service"
  end

  config.define_park_vm "Fedora 24 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora24"
    box.provision_park_vm [
      "install-desktop-fedora.sh",
      "enable-desktop-systemd.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
  end


  # CentOS
  config.define_park_vm "CentOS 6 (32 bit)" do |box|
    box.vm.box = "boxcutter/centos68-i386"
    box.provision_park_vm [
      "install-desktop-centos6.sh",
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
  end

  config.define_park_vm "CentOS 6 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos68-desktop"
    box.provision_park_vm [
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
  end

  config.define_park_vm "CentOS 7 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos72-desktop"
    box.provision_park_vm [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
    ]
  end


  # openSUSE
  config.define_park_vm "openSUSE Leap 42.1 (64 bit)" do |box|
    box.vm.box = "opensuse/openSUSE-42.1-x86_64"
    box.provision_park_vm [
      "install-desktop-opensuse-kde.sh",
      "enable-desktop-systemd.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-opensuse.sh",
    ]
  end


  # Windows
  config.define_park_vm "Windows XP Professional (32 bit)" do |box|
    box.vm.box = "winxp32-professional"
  end

  config.define_park_vm "Windows 7 Enterprise (64 bit)" do |box|
    box.vm.box = "eval-win7x64-enterprise-nocm"
    box.provision_park_vm [
      "keymap-windows.ps1",
    ]
  end

  config.define_park_vm "Windows 10 Enterprise (64 bit)" do |box|
    box.vm.box = "inclusivedesign/windows10-eval"
    box.provision_park_vm [
      "keymap-windows.ps1",
    ]
  end

end
