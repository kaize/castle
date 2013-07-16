require 'test_helper'

class Web::Admin::MenuItems::PagesControllerTest < ActionController::TestCase
  def setup
    @page = create :page
    @params = { menu_item_id: @page.menu_item.id }
    @attrs = attributes_for(:page)
  end

  test "should get index" do
    get :index, @params
    assert_response :success
  end

  test "should get new" do
    get :new, @params
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params.merge(id: @page.id)
    assert_response :success
  end

  test "should post create" do
    post :create, @params.merge(page: @attrs, id: @page.id)
    assert_response :redirect
  end

  test "should put update" do
    put :update, @params.merge(page: @attrs, id: @page.id)
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params.merge(id: @page.id)
    assert_response :redirect
  end
end
