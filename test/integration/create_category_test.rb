require "test_helper"

class CreateCategoryTest < ActionDispatch::IntegrationTest
  test "get new catgeory form and create new category" do
    get new_category_url
    assert_response :success
    assert_difference 'Category.count', 1 do
      post categories_url, params: { category: { name: "Health" } }
      assert_response :redirect
    end
      follow_redirect!
      assert_response :success
      assert_match "Health", response.body
  end
end
