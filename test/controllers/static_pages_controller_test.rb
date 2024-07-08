require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  test "should get AboutMe" do
    get static_pages_AboutMe_url
    assert_response :success
  end

  test "should get ContactMe" do
    get static_pages_ContactMe_url
    assert_response :success
  end
end
