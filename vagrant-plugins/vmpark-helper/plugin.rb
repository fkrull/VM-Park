module VMParkHelper
  class Plugin < Vagrant.plugin("2")
    name "VM Park Helper"

    config(:vmpark) do
      require_relative "config"
      Config
    end

    action_hook(:vmpark_provisioner, :machine_action_provision) do |hook|
      require_relative "provision-helper"
      hook.prepend(ProvisionHelperHook)
    end
  end
end