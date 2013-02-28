require 'test_helper'

class Web::Admin::CategoriesControllerTest < ActionController::TestCase
  def setup

    @category = create :category
    @params = {id: @category.id}
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
    @params[:category] = attributes_for(:category)
    post :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:category] = attributes_for(:category)
    get :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
  end
end
