require 'test_helper'

class UserConsole::ToolControllerTest < ActionDispatch::IntegrationTest
  test "should get metis_prepare" do
    get user_console_tool_metis_prepare_url
    assert_response :success
  end

  test "should get metis" do
    get user_console_tool_metis_url
    assert_response :success
  end

  test "should get analyzer_prepare" do
    get user_console_tool_analyzer_prepare_url
    assert_response :success
  end

  test "should get analyzer" do
    get user_console_tool_analyzer_url
    assert_response :success
  end

  test "should get rehasher_prepare" do
    get user_console_tool_rehasher_prepare_url
    assert_response :success
  end

  test "should get rehasher" do
    get user_console_tool_rehasher_url
    assert_response :success
  end

end
