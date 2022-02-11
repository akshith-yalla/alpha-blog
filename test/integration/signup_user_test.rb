require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest
  test "get signup form and create new user" do
    get signup_url
    assert_response :success
    assert_difference "User.count", 1 do
      post users_url, params: { user: { username: "Test User", email: "test@example.com", password: "password" }}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "Welcome to Alpha Blog Test User!, You have successfully signed up!", response.body
  end
end
