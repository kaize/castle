require 'test_helper'

class Web::Admin::PhotoAlbumsControllerTest < ActionController::TestCase

  setup do
    @photo_album = create :photo_album, :with_photo

    @params = {:id => @photo_album.id}
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

  test "should post create" do
    @params[:photo_album] = attributes_for(:photo_album, :with_photo)
    post :create, @params
    assert_response :redirect
  end

  test "should put update" do
    @params[:photo_album] = attributes_for(:photo_album)
    put :update, @params
    assert_response :redirect
  end

  test "should delete destroy" do
    delete :destroy, @params
    assert_response :redirect
  end
end