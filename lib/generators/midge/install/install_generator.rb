module Prospecto
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)

    def write_midge_initializer
      template 'midge.rb', "config/initializers/midge.rb"
    end
  end
end
