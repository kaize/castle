require 'test_helper'

class Web::StudyRequestsControllerTest < ActionController::TestCase
  setup do
    @study_request = create :study_request
    @params = {}
    @params[:study_request] = {address: @study_request.address, birth_date: @study_request.birth_date, children_first_name: @study_request.children_first_name, children_last_name: @study_request.children_last_name, children_middle_name: @study_request.children_middle_name, note: @study_request.note, parent_first_name: @study_request.parent_first_name, parent_last_name: @study_request.parent_last_name, parent_middle_name: @study_request.parent_middle_name, phone: @study_request.phone, school: @study_request.school, union_id: @study_request.union_id}
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create study_request" do
    assert_difference('StudyRequest.count') do
      post :create, @params
    end

    assert_redirected_to root_path
  end
end
