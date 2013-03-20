require  'test_helper'

class SitemapParserTest < ActiveSupport::TestCase
  setup do 
    @sitemap = fixture_read('sitemap')
  end
  
  test "parsing xml document for news" do
    url_news = "http://oddt.ucoz.ru/news/test"
    sitemap = SitemapParser.parse(@sitemap, single: true)
    assert_equal url_news, sitemap.news.first
  end

end