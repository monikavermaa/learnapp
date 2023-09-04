require "test_helper"

class Api::TreeControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_tree_index_url
    assert_response :success
  end

  test "should get create" do
    get api_tree_create_url
    assert_response :success
  end
end
