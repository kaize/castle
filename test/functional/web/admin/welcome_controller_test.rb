require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  def setup
    user = create :user
    sign_in user
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
