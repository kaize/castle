class NewsImporter
  
  def links
    uri = URI.parse "http://oddt.ucoz.ru/sitemap.xml"
    content = uri.read
    @links ||= SitemapParser.parse content, single: true
  end
  
  def link_to_uri(link)
    uri = URI.parse link
    url = uri.path
    uri.path = "/api#{url}"
    uri
  end
  
  def api_links_news
    links.news.map {|link| link_to_uri(link)}
  end
  
  def import_news
    uri = api_links_news
    uri.each do |link|
      news_data = NewsParser.parse(link.read, single: true)
      news = News.new body: news_data.body, title: news_data.title, published_at: news_data.published_at
      news.publish
    end
  end
end
