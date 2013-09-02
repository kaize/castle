require 'test_helper'

class Web::Admin::SessionsControllerTest < ActionController::TestCase
  test "should authenticate" do
    attrs = {}
    user = create :user
    attrs[:email] = user.email
    attrs[:password] = user.password
    post :create, user_sign_in_type: attrs
    assert_response :redirect
    assert { user_signed_in? }
  end

  test "should not authenticate" do
    attrs = {}
    user = create :user
    attrs[:email] = user.email
    attrs[:password] = 'wrong_pass'
    post :create, user_sign_in_type: attrs
    assert_response :success
    assert { !user_signed_in? }
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should delete destroy" do
    user = create :user
    sign_in user
    delete :destroy
    assert_response :redirect
    assert { !user_signed_in? }
  end
end
