require 'test_helper'

class Web::PhotoAlbumsControllerTest < ActionController::TestCase
  setup do
    @photo_album = create :photo_album, :with_photo

    @params = {:id => @photo_album.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end
  
  test "should get show" do
    get :show, @params
    assert_response :success
  end
  
  
end
