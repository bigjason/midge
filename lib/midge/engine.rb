module Midge
  class Engine < Rails::Engine
    initializer "midge.configure_rails_initialization", :after => "sprockets.environment", :group => :all do |app|
      next unless app.config.assets.enabled

      require 'sprockets'
      require 'sprockets/engines'

      if ::Midge.application_config.js_null_processor
        app.assets.register_engine '.js', ::Midge::JavascriptNullProcessor
      end

      ::Midge.application_config.configure!(app.assets)
    end
  end
end
