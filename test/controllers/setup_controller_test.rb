require "test_helper"

class SetupControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get setup_dashboard_url
    assert_response :success
  end
end
