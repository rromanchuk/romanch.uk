require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  
  test "home" do
    get root_url, headers: {"Host": "personal.test"}
    assert_response :success
    assert_select "title"
  end

  test "flying" do
    get page_url("flying"), headers: {"Host": "personal.test"}
    assert_response :success
    assert_select "title"
  end
end
