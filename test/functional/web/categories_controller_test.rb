require 'test_helper'

class Web::CategoriesControllerTest < ActionController::TestCase
  def setup
    @category = create :category
    @params = {id: @category.id}
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end
end
