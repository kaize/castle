require  'test_helper'

class NewsParserTest < ActiveSupport::TestCase
  test "parser news" do
   @news_content = fixture_file_upload('news.xml', 'text/xml').read 
    
    news_data = NewsParser.parse @news_content, single: true
    
    assert_equal 'title', news_data.title
    assert_equal "body <IMG src=\"/test.png\">", news_data.body
    assert_equal Time.at(1363259590), news_data.published_at
  end
  
end