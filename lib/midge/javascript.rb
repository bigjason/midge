require "tilt"

module Midge

  # Pass through javascript processor.
  class JavascriptNullProcessor < ::Tilt::Template
    self.default_mime_type = 'application/javascript'

    def prepare
    end

    def initialize_engine
    end

    def self.engine_initialized?
     true
    end

    def evaluate(scope, locals, &block)
      data
    end

  end

  class JavascriptProcessor < Tilt::Template
    include Util

    def self.default_mime_type
      'application/javascript'
    end

    def self.engine_initialized?
      true
    end

    def prepare
    end

    def evaluate(scope, locals, &block)
      <<-SCRIPT
(function(exports) {
  #{indent(data)}
}).call(this, (this.#{global_name} || (this.#{global_name} = {})));
      SCRIPT
    end

    def global_name
      Rails.application.class.parent_name
    end

  end

end
