require 'test_helper'

class CategoriesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get category_path(1)
    assert_response :success
  end

end
