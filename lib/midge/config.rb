require 'sprockets'
require 'sprockets/engines'

module Midge
  class Config
    def initialize
      @jst_processors = []
      @js_processors = []
    end

    def jst_processor(extension, namespace=Rails.application.class.parent_name)
      @jst_processors << [extension, namespace]
    end

    def js_processor(extension, namespace=Rails.application.class.parent_name)
      @js_processors << [extension, namespace]
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
      new_klass = Class.new(klass) do
        @@mutex = Mutex.new

        def self.set_namespace(namespace)
          @@mutex.synchronize do
            @@namespace = namespace
          end
        end

        def global_name
          @@mutex.synchronize do
            @@namespace
          end
        end
      end

      new_klass.set_namespace(namespace)
      new_klass
    end

  end
end
