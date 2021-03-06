module VMParkHelper
  class Config < Vagrant.plugin(2, :config)
    attr_accessor :env
    attr_accessor :prefix
    attr_accessor :reload
    attr_accessor :auto_hostname

    def initialize
      super
      @env = UNSET_VALUE
      @prefix = UNSET_VALUE
      @reload = UNSET_VALUE
      @auto_hostname = UNSET_VALUE
    end

    def finalize!
      @env = {} if @env == UNSET_VALUE
      @prefix = "provision/" if @prefix == UNSET_VALUE
      @reload = true if @reload == UNSET_VALUE
      @auto_hostname = true if @auto_hostname == UNSET_VALUE
    end
  end
end
