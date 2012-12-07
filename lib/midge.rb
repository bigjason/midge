require "midge/util"
require "midge/config"
require "midge/javascript"
require "midge/template"
require "midge/engine" if defined?(Rails)

module Midge
  class << self
    def application_config
      @application_config ||= ::Midge::Config.new
    end

    # Called from the initializer
    def setup
      yield(application_config)
    end
  end
end
