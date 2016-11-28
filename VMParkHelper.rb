def _define_park_vm(config, name, block)
  current_box = ENV["VM_PARK_MACHINE"] or ""
  is_primary = current_box == name
  config.vm.define name, autostart: is_primary, primary: is_primary do |box|

    def box.provision_park_vm(scripts)
      for script in scripts
        self.vm.provision "shell", path: "provision/" + script, env: Env
      end
    end

    block.call(box)
  end
end
