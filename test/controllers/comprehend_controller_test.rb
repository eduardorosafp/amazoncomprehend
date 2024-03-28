require "test_helper"

class ComprehendControllerTest < ActionDispatch::IntegrationTest
  test "should get analyze_text" do
    get comprehend_analyze_text_url
    assert_response :success
  end
end
