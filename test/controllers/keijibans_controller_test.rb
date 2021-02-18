require 'test_helper'

class KeijibansControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get keijibans_show_url
    assert_response :success
  end

end
