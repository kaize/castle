require 'test_helper'

class Web::SchedulesControllerTest < ActionController::TestCase
  def setup
    @group = create :group
    @params = {id: @group.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, @params
    assert_response :success
  end
end
