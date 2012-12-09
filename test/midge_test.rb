require "test_helper"
require "execjs"

class MidgeTest < ActiveSupport::TestCase
  def get_script(name)
    Rails.application.assets.find_asset(name).to_s
  end

  def eval_script(name, script_text)
    context = ExecJS.compile get_script(name)
    context.eval script_text
  end

  test "Wraps normal script in a closure with an exports object" do
    assert_equal eval_script("test1", "MidgeTest.name"), "Test1"
  end

  test "Wraps template in a namespaced JST" do
    assert_equal eval_script("test2", "MidgeTest.JST['test2']"), "Test2"
  end
end
