require 'test_helper'

class Web::EventsControllerTest < ActionController::TestCase
  def setup
    @event = create :event
    @params = {id: @event.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end
end
