require 'test_helper'

class PhotoAlbumsTest < ActiveSupport::TestCase
    
  test "hide another from main" do
    p1 = create :photo_album, main: true
    p2 = create :photo_album, main: false  
    p2.update_attribute(:main, true)
    p1.reload
    assert_equal false, p1.main
  end
end
