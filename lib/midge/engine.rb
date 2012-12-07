module Midge
  class Engine < Rails::Engine
    initializer "midge.configure_rails_initialization", :after => "sprockets.environment", :group => :all do |app|
      next unless app.config.assets.enabled

      require 'sprockets'
      require 'sprockets/engines'

      app.assets.register_engine '.js', ::Midge::JavascriptNullProcessor
      ::Midge.application_config.configure!(app.assets)
    end
  end
end
