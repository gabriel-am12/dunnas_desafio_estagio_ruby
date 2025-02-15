require "test_helper"

class AtendenteControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get atendente_dashboard_url
    assert_response :success
  end
end
