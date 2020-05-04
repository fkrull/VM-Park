module VMParkHelper
  class VMParkProvisionerConfig < Vagrant.plugin(2, :config)
    attr_accessor :scripts

    def initialize
      @scripts = UNSET_VALUE
    end

    def finalize!
      @scripts = [] if @scripts == UNSET_VALUE
    end
  end

  class VMParkProvisioner < Vagrant.plugin(2, :provisioner)
    def initialize(machine, config)
      super(machine, config)
      create_provisioners(config.scripts, machine.config)
    end

    def configure(config)
      if config.vm.hostname.nil? and config.vmpark.auto_hostname
        hostname = @machine.name.to_s
          .gsub(/[. ]/, '-')
          .gsub(/[()]/, '')
          .downcase
        @machine.ui.info "Using default hostname '#{hostname}'."
        config.vm.hostname = hostname
      end
    end

    def create_provisioners(scripts, config)
      for script_line in scripts
        args = script_line.split()
        script = args.shift()
        config.vm.provision :shell, path: path(script, config), args: args, env: config.vmpark.env, name: script
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
