require 'test_helper'

class Web::Admin::PagesControllerTest < ActionController::TestCase
  def setup
    @page = create :page
    @params = { id: @page.id }
    @attrs = attributes_for(:page)
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
    post :create, @params.merge(page: @attrs)
    assert_response :redirect
  end

  test "should put update" do
    put :update, @params.merge(page: @attrs)
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
