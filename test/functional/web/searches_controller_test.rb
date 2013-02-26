require 'test_helper'

class Web::SearchesControllerTest < ActionController::TestCase
  def setup
  end

  test "should get show" do
    get :show
    assert_response :success
  end
end
