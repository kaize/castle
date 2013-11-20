require 'test_helper'

class Web::StudyRequestsControllerTest < ActionController::TestCase
  setup do
    @study_request = create :study_request
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_request" do
    union = @study_request.union
    params = attributes_for(:study_request).merge(union_id: union.id)
    post :create, study_request: params
    assert_response :redirect

    study_request = StudyRequest.last
    assert_equal params[:email], study_request.email
  end
end
