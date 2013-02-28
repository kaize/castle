require 'test_helper'

class Web::Admin::GroupScheduleClassroomsControllerTest < ActionController::TestCase
  setup do

    @classroom = create :group_schedule_classroom
    @attrs = attributes_for :group_schedule_classroom
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should post create" do
    post :create, group_schedule_classroom: @attrs
    assert_response :redirect

    classroom =  Group::Schedule::Classroom.find_by_name @attrs[:name]
    assert classroom
  end

  test "should get edit" do
    get :edit, id: @classroom.id
    assert_response :success
  end

  test "should put update" do
    put :update, id: @classroom.id, group_schedule_classroom: @attrs
    assert_response :redirect
    classroom =  Group::Schedule::Classroom.find_by_name @attrs[:name]
    assert classroom
  end

  test "should delele destroy" do
    delete :destroy, id: @classroom.id
    assert_response :redirect
    classroom = Group::Schedule::Classroom.find_by_id @classroom
    assert_nil classroom
  end
end
