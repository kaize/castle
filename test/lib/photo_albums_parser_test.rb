require  'test_helper'

class PhotoAlbumsParserTest < ActiveSupport::TestCase
  setup do 
    @photo_album_content = fixture_file_upload('photo_album.xml', 'text/xml').read
  end
  
  test "parsing xml document for photo_albums" do
    url_photo_albums = "http://oddt.ucoz.ru/_ph/47/892735149.jpg"
    photo_albums = PhotoAlbumsParser.parse(@photo_album_content, single: true)
    assert_equal url_photo_albums, photo_albums.photo_urls.first
  end
  
end