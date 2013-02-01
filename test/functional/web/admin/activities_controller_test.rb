require 'test_helper'

class Web::Admin::ActivitiesControllerTest < ActionController::TestCase
  def setup
    @activity = create :activity
    @params = {id: @activity.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get show" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should post create" do
    @params[:activity] = attributes_for(:activity)
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:activity] = attributes_for(:activity)
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
  