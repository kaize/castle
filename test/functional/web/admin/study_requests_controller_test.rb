require 'test_helper'

class Web::Admin::StudyRequestsControllerTest < ActionController::TestCase
  setup do
    http_login
    @study_request = create :study_request
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :show, id: @study_request.id
    assert_response :success
  end

  test "should get destroy" do
    get :destroy, id: @study_request.id
    assert_response :redirect
  end
end
