require 'test_helper'

class Web::Admin::PagesControllerTest < ActionController::TestCase
  def setup
    @page = create :page
    @params = {id: @page.id}
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
    @params[:page] = attributes_for(:page)
    get :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:page] = attributes_for(:page)
    get :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
  end
end
