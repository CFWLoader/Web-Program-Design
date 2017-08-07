require 'test_helper'

class UserConsoleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_console_index_url
    assert_response :success
  end

end
