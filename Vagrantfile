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


# local/bundled plugins
require_relative "vagrant-plugins/vagrant-reload/lib/vagrant-reload"
require_relative "vagrant-plugins/vmpark-helper/plugin"


Vagrant.configure("2") do |config|
  config.vmpark.env = Env
  config.vmpark.reload = true
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
  config.vm.define "Ubuntu 12.04 (32 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1204-i386"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.vm.define "Ubuntu 12.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1204-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
    ]
  end

  config.vm.define "Ubuntu 14.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1404-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04 (32 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-i386"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
    ]
  end

  config.vm.define "Ubuntu 16.10 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1610-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
    ]
  end


  # Debian
  config.vm.define "Debian 7 (64 bit)" do |box|
    box.vm.box = "boxcutter/debian7"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
      "install-desktop-debian.sh",
      "autologin-gdm3.sh",
    ]
  end

  config.vm.define "Debian 8 (64 bit)" do |box|
    box.vm.box = "boxcutter/debian8-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
    ]
  end

  config.vm.define "Debian Unstable (64 bit)" do |box|
    box.vm.box = "boxcutter/debian8"

    box.vm.provision :vmpark, scripts: [
      "install-debian-unstable.sh",
      "install-desktop-debian-xfce.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-lightdm.sh",
    ]
  end


  # Fedora
  config.vm.define "Fedora 23 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora23"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "enable-desktop-systemd.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
    box.vm.provision "shell", inline: "systemctl enable sshd.service"
  end

  config.vm.define "Fedora 24 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora24"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "enable-desktop-systemd.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
  end


  # CentOS
  config.vm.define "CentOS 6 (32 bit)" do |box|
    box.vm.box = "boxcutter/centos68-i386"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-centos6.sh",
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 6 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos68-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone-redhat.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 7 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos72-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone-redhat.sh",
    ]
  end


  # openSUSE
  config.vm.define "openSUSE Leap 42.1 (64 bit)" do |box|
    box.vm.box = "opensuse/openSUSE-42.1-x86_64"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "enable-desktop-systemd.sh",
      "keymap-localectl.sh",
      "timezone-redhat.sh",
      "autologin-opensuse.sh",
    ]
  end


  # Windows
  config.vm.define "Windows XP Professional (32 bit)" do |box|
    box.vm.box = "winxp32-professional"
  end

  config.vm.define "Windows 7 Enterprise (64 bit)" do |box|
    box.vm.box = "eval-win7x64-enterprise-nocm"
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
    ]
  end

  config.vm.define "Windows 10 Enterprise (64 bit)" do |box|
    box.vm.box = "inclusivedesign/windows10-eval"
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
    ]
  end

end
