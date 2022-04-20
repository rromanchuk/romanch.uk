class Service
  private_methods :new
  class << self
    def call(...)
      new(...).call
    end
  end
end