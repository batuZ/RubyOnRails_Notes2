require 'test_helper'

class RootControllerTest < ActionDispatch::IntegrationTest
  test "should get welcome" do
    get root_welcome_url
    assert_response :success
  end

  test "should get first" do
    get root_first_url
    assert_response :success
  end

  test "should get second" do
    get root_second_url
    assert_response :success
  end

end
