require "test_helper"

class Public::DmsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get public_dms_index_url
    assert_response :success
  end

  test "should get show" do
    get public_dms_show_url
    assert_response :success
  end
end
