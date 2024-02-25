require "test_helper"

class ErrorsControllerTest < ActionDispatch::IntegrationTest
  test "should get reservation_error" do
    get errors_reservation_error_url
    assert_response :success
  end
end
