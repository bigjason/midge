require "test_helper"

class ConfigTest < ActiveSupport::TestCase
  attr_reader :config

  def setup
    @config = Midge::Config.new
  end

  test "js_null_processor is false by default" do
    assert_equal config.js_null_processor, true
  end

  test "set js_null_processor to false" do
    config.set :js_null_processor, false
    assert_equal config.js_null_processor, false
  end
end
