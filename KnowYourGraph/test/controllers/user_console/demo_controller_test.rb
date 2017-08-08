require 'test_helper'

class UserConsole::DemoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_console_demo_index_url
    assert_response :success
  end

end
