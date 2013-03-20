require  'test_helper'

class PhotoAlbumsParserTest < ActiveSupport::TestCase
  setup do 
    url = "http://oddt.ucoz.ru/api/photo/pervaja_uljanovskaja_vecherinka_dlja_artistov_originalnogo_zhanra/47"
    stub_request(:get, url).to_return(:status => 200, :body => fixture_read('photo_album'), :headers => {})     
    uri = URI.parse url
    @photo_albums = uri.read
  end
  
  test "parsing xml document for photo_albums" do
    url_photo_albums = "http://oddt.ucoz.ru/_ph/47/892735149.jpg"
    photo_albums = PhotoAlbumsParser.parse(@photo_albums, single: true)
    assert_equal url_photo_albums, photo_albums.photo_urls.first
  end
  
end