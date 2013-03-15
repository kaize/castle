class UcozExporter
  
  def links
    sitemap_file = File.read("#{Rails.root}/lib/exports/sitemap.xml")
    @links ||= SitemapParser.parse(sitemap_file, single: true)
  end
  
  def link_to_uri(link)
    uri = URI.parse link
    url = uri.path
    uri.path = "/api#{url}"
    uri
  end
  
  def api_links_news
    links.news.map {|link| uri = link_to_uri(link)}
  end
  
  def api_links_photo_albums
    links.photo_albums.map {|link| uri = link_to_uri(link)}
  end
  
  def import_news
    uri = api_links_news
    uri.each do |link|
      news_data = NewsParser.parse(link.read, single: true)
      news = News.new body: news_data.body, title: news_data.title, published_at: news_data.published_at
      news.publish
    end
  end
  
  def import_photo_albums
    uri = api_links_photo_albums
    uri.each do |link|
      photo_albums = PhotoAlbumsParser.parse(link.read, single: true)
      uri_photos = URI.parse "http://oddt.ucoz.ru/api#{photo_albums.url}"
      photos = PhotoParser.parse(uri_photos.read, single: true)
      
      photo_album = PhotoAlbum.new name: photo_albums.name
      photo_album.publish
    
      photos.urls.each do |photo_url|
        photo = PhotoAlbum::Photo.new photo_album_id: photo_album.id
        photo.remote_image_url = photo_url
        photo.save
      end 
    end
  end
  
end
