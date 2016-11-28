module VMParkHelper
  class ProvisionHelperHook
    def initialize(app, env)
      @app = app
    end

    def call(env)
      config = env[:machine].config
      scripts = config.vmpark.scripts

      for script in scripts
        config.vm.provision :shell, path: path(config, script), env: config.vmpark.env, name: script
      end

      if config.vmpark.reload
        config.vm.provision :reload
      end

      config.vm.finalize!

      @app.call(env)
    end

    def path(config, script)
      config.vmpark.prefix + "/" + script
    end
  end
end
