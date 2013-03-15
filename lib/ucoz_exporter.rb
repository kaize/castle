class UcozExporter
  
  def links
    uri = URI.parse "http://oddt.ucoz.ru/sitemap.xml"
    @links ||= SitemapParser.parse(uri.read, single: true)
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
  
  def html_photo_album_parse(html_document)
    doc = Nokogiri::HTML html_document 
    links = doc.xpath "/html/body/div/div/div/table/tbody/tr/td/div/span/table/tr/td/a"
    links.map {|link| {url: link.xpath("@href").text , name: link.xpath("text()").text}}
  end
  
  def import_photo_albums
    uri = URI.parse "http://oddt.ucoz.ru/photo/"
    photo_albums = html_photo_album_parse(uri.read)
    
    photo_albums.each do |photo_album|
      uri_photos = URI.parse photo_album[:url]
      
      photos = PhotoParser.parse(uri_photos.read, single: true)
      
      photo_album_new = PhotoAlbum.new name: photo_album[:name]
      photo_album_new.publish
      
      photos.urls.each do |photo_url|
        photo = PhotoAlbum::Photo.new photo_album_id: photo_album_new.id
        photo.remote_image_url = photo_url
        photo.save
      end
    end
  end
  
end
