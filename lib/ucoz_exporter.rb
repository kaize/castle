class UcozExporter
  
  def links
    @links ||= SitemapParser.parse(File.read("#{Rails.root}/lib/exports/sitemap.xml"), single: true)
  end
  
  def links_parse(link)
    uri = URI.parse(link)
    url = uri.path
    uri.path = "/api#{url}"
    uri
  end
  
  def api_links_news
    links_with_api = []
    links.news.each do |link|
      uri = links_parse(link)
      links_with_api << uri
    end
    links_with_api
  end
  
  def api_links_photo_albums
    links_with_api = []
    links.photo_albums.each do |link|
      uri = links_parse(link)
      links_with_api << uri
    end
    links_with_api
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
