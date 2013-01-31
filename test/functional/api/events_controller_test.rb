require 'test_helper'

class Api::EventsControllerTest < ActionController::TestCase

  test "should get index" do
    events = create_list :event, 5
    get :index, format: :json
    assert_response :success

  end

end