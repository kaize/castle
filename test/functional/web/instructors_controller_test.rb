require 'test_helper'

class Web::InstructorsControllerTest < ActionController::TestCase
  def setup
    @instructor = create :instructor
    @params = {id: @instructor.id}
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
