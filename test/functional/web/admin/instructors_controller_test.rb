require 'test_helper'

class Web::Admin::InstructorsControllerTest < ActionController::TestCase
  def setup
    user = create :user
    sign_in user

    @instructor = create :instructor
    @params = {id: @instructor.id}
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

  test "should get create" do
    @params[:instructor] = attributes_for(:instructor)
    post :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:instructor] = attributes_for(:instructor)
    put :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
