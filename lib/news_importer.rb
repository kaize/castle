class NewsImporter
  
  def links
    uri = URI.parse "http://oddt.ucoz.ru/sitemap.xml"
    content = uri.read
    SitemapParser.parse content, single: true
  end
  
  def link_to_uri(link)
    uri = URI.parse link
    path = uri.path
    uri.path = "/api#{path}"
    uri
  end
  
  def api_links_news
    links.news.map {|link| link_to_uri(link)}
  end
  
  def get_img_url(html_document)
    doc = Nokogiri::HTML html_document 
    img = doc.xpath "//img/@src"
    img.text
  end
  
  def img_replace(body, path)
    img_url = get_img_url body
    return body if body.scan(img_url).blank?
    body.gsub!(img_url, path)
  end
  
  def import_news
    uris = api_links_news
    uris.each do |link|
      news_data = NewsParser.parse(link.read, single: true)
      img_url = get_img_url news_data.body
      body = news_data.body
      if img_url.present?
        picture = Ckeditor::Picture.new
        picture.remote_data_url= "http://oddt.ucoz.ru#{img_url}"
        picture.save
        if picture.data_url.present?
          body = img_replace news_data.body, picture.data_url
        end
      end
      news = News.new body: body, title: news_data.title, published_at: news_data.published_at
      news.publish
    end
  end
end
