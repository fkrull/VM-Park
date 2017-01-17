# -*- mode: ruby -*-
# vi: set ft=ruby :


begin
  require_relative "local_config"
rescue LoadError
end

# Defaults.

# Number of CPUs per VM.
Cpus = 2 unless defined?(Cpus)
# Amount of memory.
Memory = 2048 unless defined?(Memory)
# Amount of video memory.
VRAM = 128 unless defined?(VRAM)
# Enable/disable 3D acceleration support.
Accelerate3D = true unless defined?(Accelerate3D)
# Path to a "public" directory that's mounted at /Public.
SyncedFolders = [
  File.expand_path("~/Public")
] unless defined?(SyncedFolders)
# Environment for the provisioning scripts.
Env = {
  # Keyboard layout.
  "KEYMAP": "de",
  # Timezone to set in the VMs.
  "TIMEZONE": "Europe/Berlin",
  "TIMEZONE_WINDOWS": "W. Europe Standard Time",
} unless defined?(Env)
# URL prefix for custom boxes; if nil, the URL is not set so boxes need to be
# added manually.
CustomBaseBoxUrl = nil unless defined?(CustomBaseBoxUrl)


# local/bundled plugins
require_relative "vagrant-plugins/vagrant-reload/lib/vagrant-reload"
require_relative "vagrant-plugins/vmpark-helper/plugin"


def configure_custom_box(config)
  if CustomBaseBoxUrl != nil
    config.vm.box_url = "#{CustomBaseBoxUrl}/#{config.vm.box}.json"
  end
end


Vagrant.configure("2") do |config|
  config.vmpark.env = Env
  config.vmpark.reload = true
  SyncedFolders.each do |path|
    basename = File.basename(path)
    config.vm.synced_folder path, "/" + basename, id: basename
  end


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
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.vm.define "Ubuntu 12.04" do |box|
    box.vm.box = "boxcutter/ubuntu1204-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone.sh",
    ]
  end

  config.vm.define "Ubuntu 14.04" do |box|
    box.vm.box = "boxcutter/ubuntu1404-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04 (32 bit)" do |box|
    box.vm.box = "boxcutter/ubuntu1604-i386"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04" do |box|
    box.vm.box = "boxcutter/ubuntu1604-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
    ]
  end

  config.vm.define "Ubuntu 16.10" do |box|
    box.vm.box = "boxcutter/ubuntu1610-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
    ]
  end


  # Ubuntu GNOME
  config.vm.define "Ubuntu GNOME 16.04" do |box|
    box.vm.box = "boxcutter/ubuntu1604"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-ubuntu-gnome.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm-ubuntu1604.sh",
    ]
  end


  # Debian
  config.vm.define "Debian 7" do |box|
    box.vm.box = "boxcutter/debian7"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian7.sh",
    ]
  end

  config.vm.define "Debian 8" do |box|
    box.vm.box = "boxcutter/debian8-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
    ]
  end

  config.vm.define "Debian Unstable" do |box|
    box.vm.box = "boxcutter/debian8"

    box.vm.provision :vmpark, scripts: [
      "install-debian-unstable.sh",
      "install-desktop-debian-xfce.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-lightdm.sh",
    ]
  end


  # Fedora
  config.vm.define "Fedora 23" do |box|
    box.vm.box = "boxcutter/fedora23"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "graphical-boot-systemd.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
    box.vm.provision "shell", inline: "systemctl enable sshd.service"
  end

  config.vm.define "Fedora 24" do |box|
    box.vm.box = "boxcutter/fedora24"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "graphical-boot-systemd.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora 25" do |box|
    box.vm.box = "boxcutter/fedora25"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "graphical-boot-systemd.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end


  # CentOS
  config.vm.define "CentOS 5" do |box|
    box.vm.box = "boxcutter/centos511"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-centos5.sh",
      "keymap-xorgconf-legacy.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 6 (32 bit)" do |box|
    box.vm.box = "boxcutter/centos68-i386"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-centos6.sh",
      "keymap-xorgconf.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 6" do |box|
    box.vm.box = "boxcutter/centos68-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 7" do |box|
    box.vm.box = "boxcutter/centos73-desktop"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
    ]
  end


  # openSUSE
  config.vm.define "openSUSE Leap 42.1" do |box|
    box.vm.box = "opensuse/openSUSE-42.1-x86_64"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "graphical-boot-systemd.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]
  end


  # elementary OS
  config.vm.define "elementary OS" do |box|
    box.vm.box = "boxcutter/ubuntu1604"
    box.vm.provision :vmpark, scripts: [
      "install-elementary.sh",
      "install-desktop-elementary.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-lightdm.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Windows
  config.vm.define "Windows 2000" do |box|
    box.vm.box = "win2k-professional"
    configure_custom_box(box)

    box.ssh.shell = "cmd"
    box.vm.provision :winssh, inline: <<-SHELL
      mklink dummy C:\\Public \\\\VBOXSVR\\Public
      mklink dummy C:\\vagrant \\\\VBOXSVR\\vagrant
    SHELL
  end

  config.vm.define "Windows XP" do |box|
    box.vm.box = "winxp32-professional"
    configure_custom_box(box)
  end

  config.vm.define "Windows XP (64 bit)" do |box|
    box.vm.box = "winxp64-professional"
    configure_custom_box(box)
  end

  config.vm.define "Windows 7 (32 bit)" do |box|
    box.vm.box = "win7x86-pro"
    configure_custom_box(box)
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
      "timezone-windows.ps1",
    ]
  end

  config.vm.define "Windows 7" do |box|
    box.vm.box = "win7x64-pro"
    configure_custom_box(box)
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
      "timezone-windows.ps1",
    ]
  end

  config.vm.define "Windows 8.1 (32 bit)" do |box|
    box.vm.box = "win81x86-pro"
    configure_custom_box(box)
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
      "timezone-windows.ps1",
    ]
  end

  config.vm.define "Windows 8.1" do |box|
    box.vm.box = "win81x64-pro"
    configure_custom_box(box)
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
      "timezone-windows.ps1",
    ]
  end

  config.vm.define "Windows 10 (32 bit)" do |box|
    box.vm.box = "win10x86-pro"
    configure_custom_box(box)
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
      "timezone-windows.ps1",
    ]
  end

  config.vm.define "Windows 10" do |box|
    box.vm.box = "win10x64-pro"
    configure_custom_box(box)
    box.vm.provision :vmpark, scripts: [
      "keymap-windows.ps1",
      "timezone-windows.ps1",
    ]
  end

end
