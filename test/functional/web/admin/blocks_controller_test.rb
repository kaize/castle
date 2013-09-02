require 'test_helper'

class Web::Admin::BlocksControllerTest < ActionController::TestCase
  def setup
    user = create :user
    sign_in user

    @block = create :block
    @params = {id: @block.id}
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
    @params[:block] = attributes_for(:block)
    get :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @attrs = attributes_for(:block)
    get :update, @params.merge(block: @attrs)
    assert_response :redirect

    @block.reload
    assert_equal @attrs[:title], @block.title
  end

  test "should get destroy" do
    get :destroy, @params
    assert_response :redirect
    refute Block.find_by_id(@block.id)
  end
end
