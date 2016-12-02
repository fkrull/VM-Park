module VMParkHelper
  class ProvisionerConfig < Vagrant.plugin(2, :config)
    attr_accessor :scripts

    def initialize
      @scripts = UNSET_VALUE
    end

    def finalize!
      @scripts = [] if @scripts == UNSET_VALUE
    end
  end
end