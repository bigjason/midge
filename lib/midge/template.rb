require "tilt"

module Midge
  class JstProcessor < ::Tilt::Template
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
      <<-JST
(function() {
  (this.#{global_name} || (this.#{global_name} = {})).JST || (this.#{global_name}.JST = {});
  this.#{global_name}.JST[#{scope.logical_path.inspect}] = #{indent(data)};
}).call(this);
      JST
    end

  end

end
