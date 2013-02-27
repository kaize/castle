require 'test_helper'

class Web::Admin::WelcomeControllerTest < ActionController::TestCase
  def setup
    http_login
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
