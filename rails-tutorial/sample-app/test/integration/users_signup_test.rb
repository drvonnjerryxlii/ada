require 'test_helper'

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "signup form should not create a user if the form info is invalid" do
    get signup_path

    assert_no_difference 'User.count' do
      post users_path, user: { name: "", email: "user@invalid",
        password: "foo", password_confirmation: "bar" }
    end

    assert_template 'users/new'
    assert_select 'div#error_explanation'
    assert_select 'div.field_with_errors'
  end

  test "signup form should create a user with if form info is valid" do
    get signup_path

    # # this is what I wrote before I got to 7.26
    # before_count = User.count
    # after_count = before_count + 1
    #
    # post users_path, user: { name: "Dr. Vonn Jerry XLII",
    #   email: "drvonnjerryxlii@gmail.com", password: "catpleasestopmeowing",
    #   password_confirmation: "catpleasestopmeowing" } # srsly cat
    #
    # assert_equal after_count, User.count
    #
    # assert_template 'users/show' # this won't work b/c redirect_to @user

    # here is the new stuff introduced in 7.26
    get signup_path
    assert_difference 'User.count', 1 do
      post_via_redirect users_path,  user: { name: "Dr. Vonn Jerry XLII",
        email: "drvonnjerryxlii@gmail.com", password: "catpleasestopmeowing",
        password_confirmation: "catpleasestopmeowing" } # srsly cat
    end
    assert_template 'users/show'
    assert_not flash.now[:failure] # not sure if this is right, but it works??
  end
end
