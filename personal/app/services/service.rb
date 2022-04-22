class Service
  private_methods :new
  class << self
    def let name, &blk
      iv = "@#{name}"

      define_method name do
        return instance_variable_get iv if instance_variable_defined? iv

        instance_variable_set iv, instance_eval(&blk)
      end
      # helper_method name

      define_method :"#{name}=" do |value|
        instance_variable_set iv, value
      end
      private :"#{name}="
    end
    
    def call(...)
      new(...).call
    end
  end
end