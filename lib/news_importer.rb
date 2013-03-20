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
  
  def img_replace(id, body)
    img = get_img_url body
    return body if body.scan(img).blank?
    img_url = get_img_url body
    img_url.insert(0, "/system/uploads/ckeditor/pictures/#{id}")
    body.gsub!(img, img_url)
  end
  
  def import_news
    uri = api_links_news
    uri.each do |link|
      news_data = NewsParser.parse(link.read, single: true)
      img_url = get_img_url news_data.body
      body = news_data.body
      if img_url.present?
        picture = Ckeditor::Picture.new
        picture.remote_data_url= "http://oddt.ucoz.ru#{img_url}"
        picture.save
        body = img_replace picture.id, news_data.body
      end
      news = News.new body: body, title: news_data.title, published_at: news_data.published_at
      news.publish
    end
  end
end
