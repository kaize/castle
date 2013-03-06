require 'test_helper'

class Web::WelcomeControllerTest < ActionController::TestCase
  setup do
    @photo_album = create :photo_album, :with_photo, main: true
    @params = {:id => @photo_album.id}
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
