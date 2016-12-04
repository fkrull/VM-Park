module VMParkHelper
  class Provisioner < Vagrant.plugin(2, :provisioner)
    def initialize(machine, config)
      super(machine, config)
      create_provisioners(config.scripts, machine.config)
    end

    def create_provisioners(scripts, config)
      for script in scripts
        config.vm.provision :shell, path: path(script, config), env: config.vmpark.env, name: script
      end

      if config.vmpark.reload and not scripts.empty?
        config.vm.provision :reload
      end

      config.vm.finalize!
    end

    def path(script, config)
      config.vmpark.prefix + "/" + script
    end
  end
end