module VMParkHelper
  class ProvisionHelperHook
    @@vmpark_provisioned = false

    def initialize(app, env)
      @app = app
    end

    def call(env)
      provision(env)
      @app.call(env)
    end

    def provision(env)
      machine = env[:machine]
      if machine == nil then return end
      config = machine.config
      if config == nil then return end
      if !@@vmpark_provisioned
        scripts = config.vmpark.scripts
        for script in scripts
          config.vm.provision :shell, path: path(config, script), env: config.vmpark.env, name: script
        end

        if config.vmpark.reload
          config.vm.provision :reload
        end

        config.vm.finalize!
        @@vmpark_provisioned = true
      end
    end

    def path(config, script)
      config.vmpark.prefix + "/" + script
    end
  end
end
