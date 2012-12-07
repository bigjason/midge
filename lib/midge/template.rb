require "tilt"

module Midge
  class JstProcessor < ::Tilt::Template
    include Util

    self.default_mime_type = 'application/javascript'

    # def prepare
    # end

    # def self.engine_initialized?
    #   true
    # end

    def evaluate(scope, locals, &block)
      <<-JST
(function() {
  (this.#{namespace} || (this.#{namespace} = {})).JST || (this.#{namespace}.JST = {});
  this.#{namespace}.JST[#{scope.logical_path.inspect}] = #{indent(data)};
}).call(this);
      JST
    end

    private

    def indent(string)
      string.gsub(/$(.)/m, "\\1  ").strip
    end

  end

end
