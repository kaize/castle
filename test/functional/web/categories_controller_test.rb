require 'test_helper'

class Web::CategoriesControllerTest < ActionController::TestCase
  test "should get show" do
    get :show
    assert_response :success
  end

end
