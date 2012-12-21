require 'test_helper'

class Web::Admin::NewsControllerTest < ActionController::TestCase
  def setup
    @news = create :news
    @params = {id: @news.id}
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
    @params[:news] = attributes_for(:news)
    get :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:news] = attributes_for(:news)
    get :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
  end
end
