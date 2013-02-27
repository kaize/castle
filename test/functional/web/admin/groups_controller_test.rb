require 'test_helper'

class Web::Admin::GroupsControllerTest < ActionController::TestCase
  def setup

    @group = create :group
    @params = {id: @group.id}
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
    @params[:group] = attributes_for(:group)
    get :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:group] = attributes_for(:group)
    get :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
  end
end
