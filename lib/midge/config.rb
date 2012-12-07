require 'sprockets'
require 'sprockets/engines'

module Midge
  class Config
    attr_reader :js_null_processor_enabled

    def initialize
      @jst_processors = []
      @js_processors = []
      set_js_null_processor_enabled(true)
    end

    def jst_processor(extension, namespace=Rails.application.class.parent_name)
      @jst_processors << [extension, namespace]
    end

    def js_processor(extension, namespace=Rails.application.class.parent_name)
      @js_processors << [extension, namespace]
    end

    def set_js_null_processor_enabled(value)
      @js_null_processor = value
    end

    def configure!(sprockets=Sprockets)
      @js_processors.each do |extension, namespace|
        sprockets.register_engine extension, create_processer(::Midge::JavascriptProcessor, namespace)
      end
      @jst_processors.each do |extension, namespace|
        sprockets.register_engine extension, create_processer(::Midge::JstProcessor, namespace)
      end
    end

    private

    def create_processer(klass, namespace)
      new_klass = Class.new(klass)
      new_klass.class_eval <<-CODE
        def global_name
          #{namespace.inspect}
        end
      CODE
      new_klass
    end

  end
end
