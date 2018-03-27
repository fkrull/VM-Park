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
      "autologin-lightdm.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 14.04" do |box|
    box.vm.box = "bento/ubuntu-14.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04 (32 bit)" do |box|
    box.vm.box = "bento/ubuntu-16.04-i386"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
      "ubuntu-fix-locale.sh",
    ]
  end

  config.vm.define "Ubuntu 16.04" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu 17.04" do |box|
    box.vm.box = "bento/ubuntu-17.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-lightdm.sh",
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
      "autologin-gdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end

  config.vm.define "Ubuntu 18.04" do |box|
    box.vm.box = "bento/ubuntu-17.10"
    box.vm.provision :vmpark, scripts: [
      "ubuntu-dev.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu.sh",
      "autologin-gdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Ubuntu GNOME
  config.vm.define "Ubuntu GNOME 16.04" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu-gnome.sh",
      "autologin-gdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Ubuntu GNOME 17.04" do |box|
    box.vm.box = "bento/ubuntu-17.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu-gnome.sh",
      "autologin-gdm-ubuntu.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Xubuntu
  config.vm.define "Xubuntu 16.04" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-xubuntu.sh",
      "autologin-lightdm.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Kubuntu
  config.vm.define "Kubuntu 17.04" do |box|
    box.vm.box = "bento/ubuntu-17.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-kubuntu.sh",
      "autologin-sddm-plasma.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Lubuntu
  config.vm.define "Lubuntu 17.10" do |box|
    box.vm.box = "bento/ubuntu-17.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-lubuntu.sh",
      "autologin-lightdm.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]
  end


  # Ubuntu MATE
  config.vm.define "Ubuntu MATE 17.10" do |box|
    box.vm.box = "bento/ubuntu-17.10"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-ubuntu-mate.sh",
      "autologin-lightdm.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # elementary OS
  config.vm.define "elementary OS" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-elementary.sh",
      "autologin-lightdm.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # KDE neon
  config.vm.define "KDE neon" do |box|
    box.vm.box = "bento/ubuntu-16.04"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-kde-neon.sh",
      "autologin-sddm-plasma.sh",
      "ubuntu-fix-locale.sh",
      "set-root-password.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Linux Mint
  config.vm.define "Linux Mint 18" do |box|
    box.vm.box = "artem-sidorenko/mint-18.1-cinnamon"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "ubuntu-fix-locale.sh",
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
    box.vm.hostname = "debian9"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian Testing" do |box|
    box.vm.box = "bento/debian-9"
    box.vm.hostname = "debian-testing"
    box.vm.provision :vmpark, scripts: [
      "debian-testing.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end

  config.vm.define "Debian Unstable" do |box|
    box.vm.box = "bento/debian-9"
    box.vm.hostname = "debian-unstable"
    box.vm.provision :vmpark, scripts: [
      "debian-unstable.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "install-desktop-debian.sh",
      "autologin-gdm-debian.sh",
      "set-root-password.sh",
    ]
  end


  # Raspberry Pi Desktop
  config.vm.define "Raspberry Pi Desktop" do |box|
    box.vm.box = "bento/debian-9.3-i386"
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
  config.vm.define "Fedora 25" do |box|
    box.vm.box = "bento/fedora-25"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora 26" do |box|
    box.vm.box = "bento/fedora-26"
    box.vm.hostname = "fedora26"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora 26 MATE" do |box|
    box.vm.box = "bento/fedora-26"
    box.vm.hostname = "fedora26-mate"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora-mate.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-lightdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-lightdm.sh",
    ]
  end

  config.vm.define "Fedora 26 KDE" do |box|
    box.vm.box = "bento/fedora-26"
    box.vm.hostname = "fedora26-kde"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora-kde.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-sddm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-sddm-plasma.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end

  config.vm.define "Fedora 26 Atomic Workstation" do |box|
    box.vm.box = "fkrull/fedora26-atomic-workstation"
    SyncedFolders.each do |path|
      basename = File.basename(path)
      config.vm.synced_folder path, "/" + basename, id: basename, disabled: true
    end
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end

  config.vm.define "Fedora 27" do |box|
    box.vm.box = "bento/fedora-27"
    box.vm.hostname = "fedora27"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-fedora.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end

  config.vm.define "Fedora 27 Atomic Workstation" do |box|
    box.vm.box = "fkrull/fedora27-atomic-workstation"
    SyncedFolders.each do |path|
      basename = File.basename(path)
      config.vm.synced_folder path, "/" + basename, id: basename, disabled: true
    end
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
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
    box.vm.box = "bento/centos-6.9-i386"
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


  # openSUSE
  config.vm.define "openSUSE 13.2" do |box|
    box.vm.box = "opensuse/openSUSE-13.2-x86_64"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse13-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end

  config.vm.define "openSUSE Leap 42.1" do |box|
    box.vm.box = "opensuse/openSUSE-42.1-x86_64"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end

  config.vm.define "openSUSE Leap 42.2" do |box|
    box.vm.box = "opensuse/openSUSE-42.2-x86_64"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end

  config.vm.define "openSUSE Leap 42.3" do |box|
    box.vm.box = "opensuse/openSUSE-42.3-x86_64"
    box.vm.hostname = "opensuse42.3"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-opensuse-kde.sh",
      "systemd-graphical-target.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-opensuse.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Mageia
  config.vm.define "Mageia 6" do |box|
    box.vm.box = "fkrull/mageia6-64"
    box.vm.hostname = "mageia6"
    box.vm.provision :vmpark, scripts: [
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-sddm-mageia.sh",
    ]

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["modifyvm", :id, "--accelerate3d", "off"]
    end
  end


  # Arch Linux
  config.vm.define "Arch Linux" do |box|
    box.vm.box = "terrywang/archlinux"
    box.vm.provision :vmpark, scripts: [
      "install-desktop-arch-gnome.sh",
      "systemd-graphical-target.sh",
      "systemd-enable-gdm.sh",
      "keymap-localectl.sh",
      "timezone.sh",
      "autologin-gdm.sh",
    ]
  end


  # FreeBSD
  config.vm.define "FreeBSD 11" do |box|
    box.vm.box = "freebsd/FreeBSD-11.1-STABLE"
    box.vm.guest = :freebsd
    box.ssh.shell = "sh"
    box.vm.base_mac = "080027D14C66"

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
    SyncedFolders.each do |path|
      basename = File.basename(path)
      config.vm.synced_folder path, "/" + basename, id: basename, disabled: true
    end

    box.vm.provision :vmpark, scripts: [
      "freebsd-termcap.sh",
      "freebsd-procfs.sh",
      "install-desktop-freebsd-gnome.sh",
      "timezone-freebsd.sh",
      "autologin-gdm-freebsd.sh",
    ]
  end


  # Haiku OS
  config.vm.define "Haiku OS" do |box|
    box.vm.box = "haikuos/x86_64"
    box.vm.guest = :linux
    box.ssh.username = "user"
    box.ssh.insert_key = false

    box.vm.synced_folder ".", "/vagrant", id: "vagrant-root", disabled: true
    SyncedFolders.each do |path|
      basename = File.basename(path)
      config.vm.synced_folder path, "/" + basename, id: basename, disabled: true
    end

    box.vm.provision :shell, privileged: false, inline: "keymap -l /system/data/Keymaps/German"

    config.vm.provider "virtualbox" do |vb|
      vb.customize ["setextradata", :id, "GUI/Scale", "off"]
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
