require 'test_helper'

class Web::Admin::MenuItemsControllerTest < ActionController::TestCase
  def setup
    @menu_item = create :menu_item
    @params = {id: @menu_item.id}
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
    @params[:menu_item] = attributes_for(:menu_item)
    get :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @attrs = attributes_for(:menu_item)
    get :update, @params.merge(menu_item: @attrs)
    assert_response :redirect

    @menu_item.reload
    assert_equal @attrs[:title], @menu_item.title
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
    refute MenuItem.find_by_id(@menu_item.id)
  end
end
