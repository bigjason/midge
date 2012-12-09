require 'sprockets'
require 'sprockets/engines'

module Midge
  class Config
    attr_reader :js_null_processor_enabled

    def initialize
      @processors = []
      set_js_null_processor_enabled(true)
    end

    def jst_processor(extension, namespace=Rails.application.class.parent_name)
      @processors << [::Midge::JstProcessor, extension, namespace]
    end

    def js_processor(extension, namespace=Rails.application.class.parent_name)
      @processors << [::Midge::JavascriptProcessor, extension, namespace]
    end

    def set_js_null_processor_enabled(value)
      @js_null_processor = value
    end

    def configure!(sprockets=Sprockets)
      @processors.each do |base_klass, extension, namespace|
        sprockets.register_engine extension, create_processer(base_klass, namespace)
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
