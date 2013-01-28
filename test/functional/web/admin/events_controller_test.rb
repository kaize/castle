require 'test_helper'

class Web::Admin::EventsControllerTest < ActionController::TestCase
  def setup
    @partner = create :event
    @params = {id: @partner.id}

  end

  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should get edit" do
    get :edit, @params
    assert_response :success
  end

  test "should get create" do
    @params[:event] = attributes_for(:event)
    post :create, @params
    assert_response :redirect
  end

  test "should get update" do
    @params[:event] = attributes_for(:event)
    put :update, @params
    assert_response :redirect
  end

  test "should get destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end
