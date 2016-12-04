module VMParkHelper
  class WinSSHProvisionerConfig < Vagrant.plugin(2, :config)
    attr_accessor :inline

    def initialize
      @inline = UNSET_VALUE
    end

    def finalize!
      @inline = "" if @inline == UNSET_VALUE
    end
  end

  class WinSSHProvisioner < Vagrant.plugin(2, :provisioner)
    def provision
      @config.inline.each_line do |line|
        @machine.communicate.execute(line.strip)
      end
    end
  end
end