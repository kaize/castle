require  'test_helper'

class NewsImporterTest < ActiveSupport::TestCase
  setup do 
    sitemap = fixture_file_upload('sitemap.xml', 'text/xml').read 
    news = fixture_file_upload('news.xml', 'text/xml').read 
    photo = fixture_file_upload("/photos/test.png", 'image/png', :true).read
    @sitemap_stub = stub_request(:get, "http://oddt.ucoz.ru/sitemap.xml").to_return(status: 200, body: sitemap, headers: {})
    @news_stub = stub_request(:get, "http://oddt.ucoz.ru/api/news/test").to_return(status: 200,  body: news, headers: {})
    @photo_stub = stub_request(:get, "http://oddt.ucoz.ru/test.png").to_return(status: 200,  body: photo, headers: {})
    @news_importer = NewsImporter.new
  end
  
  test "import news" do
    @news_importer.import_news
    assert_requested @sitemap_stub
    assert_requested @news_stub
    assert_requested @photo_stub
    assert_equal 1, Ckeditor::Picture.count 
    assert_equal 1, News.count
  end
  
end