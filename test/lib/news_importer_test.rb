require  'test_helper'

class NewsImporterTest < ActiveSupport::TestCase
  setup do 
    @news = create :news, body: "body", title: "title", published_at: Time.at(1363259590)
  end
  
  test "import news" do
   url = "http://oddt.ucoz.ru/api/news/skazhi_zhizni_da/2013-03-14-264"
   stub = stub_request(:get, url).to_return(:status => 200, :body => fixture_read('news'), :headers => {})     
    
    uri = URI.parse url
    link = uri.read
    news_data = NewsParser.parse link, single: true
    
    assert_requested(stub)
    
    assert_equal @news.title, news_data.title
    assert_equal @news.body, news_data.body
    assert_equal @news.published_at, news_data.published_at
  end
  
end