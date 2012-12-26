require 'test_helper'

class Web::UnionsControllerTest < ActionController::TestCase
  def setup
    @union = create :union
    @params = {id: @union.id, category_id: @union.category_id}
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end
end
