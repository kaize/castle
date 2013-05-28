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
    imgs = doc.xpath "//img/@src"
    imgs.map {|img| img.text}
  end
  
  def clean_tags(body_html)
    doc = Nokogiri::HTML body_html
    doc.xpath("//@style[not(parent::img)]").each {|style| style.remove }
    doc.xpath("//div[@align]/@align").each {|align| align.remove }
    doc.xpath("/html/body").inner_html
  end
  
  def fetch_image(body)
    img_url = get_img_url body
    return body if img_url.nil?
    img_url.each do |img|
      picture = Ckeditor::Picture.new
      picture.remote_data_url= "http://oddt.ucoz.ru#{img}"
      picture.save
      body.gsub!(img, picture.data_url) if picture.data_url.present?
    end
    body
  end
  
  def import_news
    uris = api_links_news
    uris.each do |link|
      news_data = NewsParser.parse(link.read, single: true)
      clean_body = clean_tags(news_data.body)
      body = fetch_image(clean_body)
      
      news = News.new body: body, title: news_data.title, published_at: news_data.published_at
      news.publish
    end
  end
  
end
