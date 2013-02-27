require 'test_helper'

class Web::Admin::UnionsControllerTest < ActionController::TestCase

  def setup

    @union = create :union
    @params = {id: @union.id}
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
    category = create :category
    @params[:union] = attributes_for(:union).merge(category_id: category.id)
    get :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:union] = attributes_for(:union)
    get :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
  end

end
