module VMParkHelper
  class Plugin < Vagrant.plugin(2)
    name "VM Park Helper"

    config(:vmpark) do
      require_relative "config"
      Config
    end

    config(:vmpark, :provisioner) do
      require_relative "provisioner_config"
      ProvisionerConfig
    end

    provisioner(:vmpark) do
      require_relative "provisioner"
      Provisioner
    end

    config(:winssh, :provisioner) do
      require_relative "provisioner_winssh"
      WinSSHProvisionerConfig
    end

    provisioner(:winssh) do
      require_relative "provisioner_winssh"
      WinSSHProvisioner
    end
  end
end