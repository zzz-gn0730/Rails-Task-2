require "test_helper"

class SettinControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get settin_show_url
    assert_response :success
  end
end
