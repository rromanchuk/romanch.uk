require "test_helper"
module RyanRomanchuk
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

    test "playgrounds" do
      get page_url("playgrounds"), headers: {"Host": "personal.test"}
      assert_response :success
      assert_select "title"
    end

    test "status" do
      get page_url("status"), headers: {"Host": "personal.test"}
      assert_response :success
      assert_select "h1"
    end

    test "public_key" do
      get page_url("public_key"), headers: {"Host": "personal.test"}
      assert_response :success
      assert_select "title"
    end
  end
end