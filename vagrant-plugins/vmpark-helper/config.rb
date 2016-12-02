module VMParkHelper
  class Config < Vagrant.plugin("2", :config)
    attr_accessor :scripts
    attr_accessor :env
    attr_accessor :prefix
    attr_accessor :reload

    def initialize
      super
      @scripts = UNSET_VALUE
      @env = UNSET_VALUE
      @prefix = UNSET_VALUE
      @reload = UNSET_VALUE
    end

    def finalize!
      @scripts = [] if @scripts == UNSET_VALUE
      @env = {} if @env == UNSET_VALUE
      @prefix = "provision/" if @prefix == UNSET_VALUE
      @reload = true if @reload == UNSET_VALUE
    end
  end
end