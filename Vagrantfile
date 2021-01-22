# -*- mode: ruby -*-
# vi: set ft=ruby :

begin
  require_relative "local_config"
rescue LoadError
end

# TODO: expand
DefaultSoundDrivers = {
  "mingw32" => "dsound",
  "linux" => "alsa",
}

# number of CPUs per VM
Cpus = 1 unless defined?(Cpus)
# amount of memory
Memory = 2048 unless defined?(Memory)
# amount of video memory
VRAM = 128 unless defined?(VRAM)
# enable/disable 3D acceleration support
Accelerate3D = false unless defined?(Accelerate3D)
# paths to additional synced folders
SyncedFolders = [] unless defined?(SyncedFolders)
# the host sound driver to use
SoundDriver = DefaultSoundDrivers[Gem::Platform.local.os] unless defined?(SoundDriver)
# environment for the provisioning scripts
Env = {
  # keyboard layout
  "KEYMAP": "de",
  # timezone to set in the VMs
  "TIMEZONE": "Europe/Berlin",
} unless defined?(Env)


# local/bundled plugins
require_relative "vagrant-plugins/vagrant-reload/lib/vagrant-reload"
require_relative "vagrant-plugins/vmpark-helper/plugin"


# synced folders actions
def synced_folder_path(basename)
  "/mnt/" + basename
end

def enable_synced_folders(ctx)
  SyncedFolders.each do |path|
    basename = File.basename(path)
    ctx.vm.synced_folder path, synced_folder_path(basename), id: basename
  end
end

def disable_synced_folders(ctx)
  SyncedFolders.each do |path|
    basename = File.basename(path)
    ctx.vm.synced_folder path, synced_folder_path(basename), id: basename, disabled: true
  end
end


Vagrant.configure("2") do |config|
  config.vmpark.env = Env
  config.vmpark.reload = true

  enable_synced_folders(config)

  config.vm.provider "virtualbox" do |vb|
    vb.memory = Memory
    vb.cpus = Cpus
    vb.gui = true
    vb.customize ["modifyvm", :id, "--clipboard", "bidirectional"]
    vb.customize ["modifyvm", :id, "--vram", VRAM]
    vb.customize ["modifyvm", :id, "--accelerate3d", Accelerate3D ? "on" : "off"]
    vb.customize [
      "modifyvm", :id,
      "--audio", SoundDriver,
      "--audiocontroller", "ac97",
      "--audioin", "on",
      "--audioout", "on",
    ]
  end

  # Ubuntu
  config.vm.define "Ubuntu 10.04" do |box|
    box.vm.box = "bento/ubuntu-10.04"
    box.vm.provision :vmpark, scripts: [
      "timezone.sh",
      "eol-sources-ubuntu.sh",
      "install-desktop-ubuntu.sh",
      "x11-config-legacy.sh",
      "keymap-gconf.sh",
      "set-root-password.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Ubuntu 12.04" do |box|
    box.vm.box = "bento/ubuntu-12.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone.sh",
      "eol-sources-ubuntu.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm-ubuntu.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 14.04" do |box|
    box.vm.box = "bento/ubuntu-14.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm-ubuntu.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04 (32 bit)" do |box|
    box.vm.box = "bento/ubuntu-16.04-i386"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 17.04" do |box|
    box.vm.box = "bento/ubuntu-17.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "eol-sources-ubuntu.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 17.10" do |box|
    box.vm.box = "bento/ubuntu-17.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "ubuntu1710-workaround-nm-issue.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 18.04" do |box|
    box.vm.box = "bento/ubuntu-18.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 18.10" do |box|
    box.vm.box = "bento/ubuntu-18.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 19.04" do |box|
    box.vm.box = "bento/ubuntu-19.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 19.10" do |box|
    box.vm.box = "bento/ubuntu-19.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 20.04" do |box|
    box.vm.box = "bento/ubuntu-20.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 20.10" do |box|
    box.vm.box = "bento/ubuntu-20.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Xubuntu
  config.vm.define "Xubuntu 20.04" do |box|
    box.vm.box = "bento/ubuntu-20.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-xubuntu.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Ubuntu GNOME
  config.vm.define "Ubuntu GNOME 16.04" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu-gnome.sh",
      "autologin-gdm-debian.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Kubuntu
  config.vm.define "Kubuntu 18.04" do |box|
    box.vm.box = "bento/ubuntu-18.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-kubuntu.sh",
      "autologin-sddm-plasma.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Kubuntu 20.04" do |box|
    box.vm.box = "bento/ubuntu-20.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-kubuntu.sh",
      "autologin-sddm-plasma.sh",
      "set-root-password.sh",
    ]
  end


  # Ubuntu MATE
  config.vm.define "Ubuntu MATE 18.04" do |box|
    box.vm.box = "bento/ubuntu-18.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu-mate.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Ubuntu Studio
  config.vm.define "Ubuntu Studio 20.04" do |box|
    box.vm.box = "bento/ubuntu-20.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntustudio.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu Studio 20.10" do |box|
    box.vm.box = "bento/ubuntu-20.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntustudio.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # elementary OS
  config.vm.define "elementary OS 0.4" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-elementary.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "elementary OS 5" do |box|
    box.vm.box = "bento/ubuntu-18.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-elementary.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Kodi
  config.vm.define "Kodi" do |box|
    box.vm.box = "bento/ubuntu-20.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-kodi.sh",
      "autologin-lightdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    box.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--graphicscontroller", "vmsvga"]
      vb.customize ["modifyvm", :id, "--accelerate3d", "on"]
    end
  end


  # KDE neon
  config.vm.define "KDE neon" do |box|
    box.vm.box = "bento/ubuntu-20.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-kde-neon.sh",
      "autologin-sddm-plasma.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Debian
  config.vm.define "Debian 6" do |box|
    box.vm.box = "bento/debian-6.0.10"
    box.vm.provision :vmpark, scripts: [
      "eol-sources-debian.sh",
      "eol-apt-allow-unauthenticated.sh",
      "keymap-xorgconf.sh",
      "timezone.sh",
      "install-desktop-debian6.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian 7" do |box|
    box.vm.box = "bento/debian-7"
    box.vm.provision :vmpark, scripts: [
      "keymap-xorgconf.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian 8" do |box|
    box.vm.box = "bento/debian-8"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian 9" do |box|
    box.vm.box = "bento/debian-9"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian 10" do |box|
    box.vm.box = "bento/debian-10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian 10 (32 bit)" do |box|
    box.vm.box = "bento/debian-10.5-i386"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian Testing" do |box|
    box.vm.box = "bento/debian-10"
    box.vm.provision :vmpark, scripts: [
      "switch-release-debian.sh testing",
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian Unstable" do |box|
    box.vm.box = "bento/debian-10"
    box.vm.provision :vmpark, scripts: [
      "switch-release-debian.sh unstable",
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end


  # Raspberry Pi Desktop
  config.vm.define "Raspberry Pi Desktop 9" do |box|
    box.vm.box = "bento/debian-9"
    box.vm.hostname = "raspberry"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-raspberrypi.sh",
      "autologin-lightdm.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Raspberry Pi Desktop 10" do |box|
    box.vm.box = "bento/debian-10"
    box.vm.hostname = "raspberry"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-raspberrypi.sh",
      "autologin-lightdm.sh",
      "set-root-password.sh",
    ]
  end


  # Fedora
  config.vm.define "Fedora Workstation 24" do |box|
    box.vm.box = "bento/fedora-24"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 25" do |box|
    box.vm.box = "bento/fedora-25"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 26" do |box|
    box.vm.box = "bento/fedora-26"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 27" do |box|
    box.vm.box = "bento/fedora-27"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 28" do |box|
    box.vm.box = "bento/fedora-28"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 29" do |box|
    box.vm.box = "bento/fedora-29"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 30" do |box|
    box.vm.box = "bento/fedora-30"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 31" do |box|
    box.vm.box = "bento/fedora-31"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 32" do |box|
    box.vm.box = "bento/fedora-32"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation 33" do |box|
    box.vm.box = "roboxes/fedora33"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Workstation Rawhide" do |box|
    box.vm.box = "roboxes/fedora33"
    box.vm.provision :vmpark, scripts: [
      "switch-release-fedora.sh rawhide",
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end


  # Fedora Silverblue
  config.vm.define "Fedora Atomic Workstation 26" do |box|
    box.vm.box = "fkrull/fedora26-atomic-workstation"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    disable_synced_folders(box)
  end

  config.vm.define "Fedora Atomic Workstation 27" do |box|
    box.vm.box = "fkrull/fedora27-atomic-workstation"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    disable_synced_folders(box)
  end

  config.vm.define "Fedora Atomic Workstation 28" do |box|
    box.vm.box = "fkrull/fedora28-atomic-workstation"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    disable_synced_folders(box)
  end

  config.vm.define "Fedora Silverblue 29" do |box|
    box.vm.box = "fkrull/fedora29-silverblue"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    disable_synced_folders(box)
  end

  config.vm.define "Fedora Silverblue 30" do |box|
    box.vm.box = "fkrull/fedora30-silverblue"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    disable_synced_folders(box)
  end

  config.vm.define "Fedora Silverblue 31" do |box|
    box.vm.box = "fkrull/fedora31-silverblue"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    disable_synced_folders(box)
  end

  config.vm.define "Fedora Silverblue 32" do |box|
    box.vm.box = "fkrull/fedora32-silverblue"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Silverblue 33" do |box|
    box.vm.box = "fkrull/fedora33-silverblue"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora Silverblue Rawhide" do |box|
    box.vm.box = "fkrull/fedora33-silverblue"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
      "switch-release-fedora-silverblue.sh rawhide",
    ]
  end


  # CentOS
  config.vm.define "CentOS 5" do |box|
    box.vm.box = "bento/centos-5.11"
    box.vm.provision :vmpark, scripts: [
      "eol-sources-centos.sh",
      "install-desktop-centos5.sh",
      "x11-config-legacy.sh",
      "keymap-gconf.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 6 (32 bit)" do |box|
    box.vm.box = "bento/centos-6.10-i386"
    box.vm.hostname = "centos6-i386"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-centos6.sh",
      "keymap-xorgconf.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 6" do |box|
    box.vm.box = "bento/centos-6"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-centos6.sh",
      "keymap-xorgconf.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 7" do |box|
    box.vm.box = "bento/centos-7"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-centos7.sh",
      "systemd-graphical-target.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS 8" do |box|
    box.vm.box = "bento/centos-8"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-centos8.sh",
      "systemd-graphical-target.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "CentOS Stream 8" do |box|
    box.vm.box = "bento/centos-8"
    box.vm.provision :vmpark, scripts: [
      "switch-release-centos.sh 8-stream",
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-centos8.sh",
      "systemd-graphical-target.sh",
      "autologin-gdm.sh",
    ]
  end


  # openSUSE
  config.vm.define "openSUSE 13" do |box|
    box.vm.box = "bento/opensuse-13.2"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse13-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]
  end

  config.vm.define "openSUSE Leap 42" do |box|
    box.vm.box = "bento/opensuse-leap-42"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", type: :rsync
    disable_synced_folders(box)
  end

  config.vm.define "openSUSE Leap 15" do |box|
    box.vm.box = "bento/opensuse-leap-15"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]
  end


  # Mageia
  config.vm.define "Mageia 6" do |box|
    box.vm.box = "fkrull/mageia6-64"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-sddm-mageia.sh",
    ]
  end


  # Amazon Linux
  config.vm.define "Amazon Linux 2" do |box|
    box.vm.box = "bento/amazonlinux-2"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-amazonlinux2.sh",
      "autologin-lightdm.sh",
    ]
  end


  # Arch Linux
  config.vm.define "Arch Linux" do |box|
    box.vm.box = "roboxes/arch"
    box.vm.provision :vmpark, scripts: [
      "arch-system-upgrade.sh",
      "set-root-password.sh",
      "install-desktop-arch-gnome.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    box.vm.synced_folder ".", "/vagrant"
  end


  # Alpine
  config.vm.define "Alpine 3.10" do |box|
    box.vm.box = "roboxes/alpine310"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-alpine-xfce.sh",
      "timezone.sh",
      "keymap-xorgconf.sh",
      "autologin-lightdm.sh",
    ]

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", type: :rsync
  end

  config.vm.define "Alpine 3.11" do |box|
    box.vm.box = "roboxes/alpine311"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-alpine-xfce.sh",
      "timezone.sh",
      "keymap-xorgconf.sh",
      "autologin-lightdm.sh",
    ]

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", type: :rsync
  end

  config.vm.define "Alpine 3.12" do |box|
    box.vm.box = "roboxes/alpine312"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-alpine-xfce.sh",
      "timezone.sh",
      "keymap-xorgconf.sh",
      "autologin-lightdm.sh",
    ]

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", type: :rsync
  end


  # FreeBSD
  config.vm.define "FreeBSD 11" do |box|
    box.vm.box = "bento/freebsd-11"

    box.vm.provision :vmpark, scripts: [
      "freebsd-procfs.sh",
      "install-desktop-freebsd-gnome.sh",
      "timezone-freebsd.sh",
      "keymap-xdg-autostart-freebsd.sh",
      "autologin-gdm-freebsd.sh",
    ]

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", type: :rsync
  end

  config.vm.define "FreeBSD 12" do |box|
    box.vm.box = "bento/freebsd-12"

    box.vm.provision :vmpark, scripts: [
      "freebsd-procfs.sh",
      "install-desktop-freebsd-gnome.sh",
      "timezone-freebsd.sh",
      "keymap-xdg-autostart-freebsd.sh",
      "autologin-gdm-freebsd.sh",
    ]

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", type: :rsync
  end
end
