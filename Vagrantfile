# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  config.vm.synced_folder File.expand_path("~/Public"), "/Public", :mount_options => ["ro"]

  config.vm.provider "virtualbox" do |vb|
     vb.memory = "2048"
     vb.cpus = 2
     vb.gui = true
     vb.customize ['modifyvm', :id, '--clipboard', 'bidirectional']
  end


  config.vm.define "Ubuntu 12.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1204-desktop"
    box.vm.provision "shell", path: "provision/keymap-xorgconf.sh"
    box.vm.provision "shell", path: "provision/timezone-debian.sh"
  end

  config.vm.define "Ubuntu 14.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1404-desktop"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-debian.sh"
  end

  config.vm.define "Ubuntu 16.04 (32 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-i386"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-debian.sh"
    box.vm.provision "shell", path: "provision/install-desktop-ubuntu.sh"
    box.vm.provision "shell", path: "provision/autologin-lightdm.sh"
  end

  config.vm.define "Ubuntu 16.04 (64 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-desktop"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-debian.sh"
  end


  # Debian
  config.vm.define "Debian 8 (64 bit)" do |box|
    box.vm.box = "boxcutter/debian8-desktop"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-debian.sh"
  end


  # Fedora
  config.vm.define "Fedora 23 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora23"

    box.vm.provision "shell", path: "provision/install-desktop-fedora.sh"
    box.vm.provision "shell", path: "provision/enable-desktop-systemd.sh"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-redhat.sh"
    box.vm.provision "shell", path: "provision/autologin-gdm.sh"

    box.vm.provision "shell", inline: "systemctl enable sshd.service"
  end

  config.vm.define "Fedora 24 (64 bit)" do |box|
    box.vm.box = "boxcutter/fedora24"

    box.vm.provision "shell", path: "provision/install-desktop-fedora.sh"
    box.vm.provision "shell", path: "provision/enable-desktop-systemd.sh"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-redhat.sh"
    box.vm.provision "shell", path: "provision/autologin-gdm.sh"
  end


  # CentOS
  config.vm.define "CentOS 6 (32 bit)" do |box|
    box.vm.box = "boxcutter/centos68-i386"
    box.vm.provision "shell", path: "provision/install-desktop-centos6.sh"
    box.vm.provision "shell", path: "provision/keymap-xorgconf.sh"
    box.vm.provision "shell", path: "provision/timezone-redhat.sh"
    box.vm.provision "shell", path: "provision/autologin-gdm.sh"
  end

  config.vm.define "CentOS 6 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos68-desktop"
    box.vm.provision "shell", path: "provision/keymap-xorgconf.sh"
    box.vm.provision "shell", path: "provision/timezone-redhat.sh"
    box.vm.provision "shell", path: "provision/autologin-gdm.sh"
  end

  config.vm.define "CentOS 7 (64 bit)" do |box|
    box.vm.box = "boxcutter/centos72-desktop"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-redhat.sh"
  end


  # openSUSE
  config.vm.define "openSUSE Leap 42.1 (64 bit)" do |box|
    box.vm.box = "opensuse/openSUSE-42.1-x86_64"

    #box.vm.provision "shell", inline: \
    #    "zypper refresh && " \
    #    "zypper --non-interactive install terminfo"

    box.vm.provision "shell", path: "provision/install-desktop-opensuse-kde.sh"
    box.vm.provision "shell", path: "provision/enable-desktop-systemd.sh"
    box.vm.provision "shell", path: "provision/keymap-localectl.sh"
    box.vm.provision "shell", path: "provision/timezone-redhat.sh"
    box.vm.provision "shell", path: "provision/autologin-opensuse.sh"
  end


  # Windows
  config.vm.define "Windows XP Professional (32 bit)" do |box|
    box.vm.box = "winxp32-professional"
  end

  config.vm.define "Windows 7 Enterprise (64 bit)" do |box|
    box.vm.box = "eval-win7x64-enterprise-nocm"
    box.vm.provision "shell", path: "provision/keymap-windows.ps1"
  end

  config.vm.define "Windows 10 Enterprise (64 bit)" do |box|
    box.vm.box = "inclusivedesign/windows10-eval"
    box.vm.provision "shell", path: "provision/keymap-windows.ps1"
  end

end
