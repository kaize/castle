class PhotoAlbumsImporter
  
  def link_to_uri(link)
    uri = URI.parse link
    path = uri.path
    uri.path = "/api#{path}"
    uri
  end
  
  def html_photo_album_parse(html_document)
    doc = Nokogiri::HTML html_document 
    links = doc.xpath "/html/body/div/div/div/table/tbody/tr/td/div/span/table/tr/td/a"
    links.map {|link| {url: link_to_uri(link.xpath("@href").text), name: link.xpath("text()").text}}
  end
  
  def import_photo_albums
    uri = URI.parse "http://oddt.ucoz.ru/photo/"
    content = uri.read
    photo_albums = html_photo_album_parse content
    
    photo_albums.each do |photo_album_attr|
      photo_album = PhotoAlbum.new name: photo_album_attr[:name]
      photo_album.publish
      
      photos_content = photo_album_attr[:url].read
      photos = PhotoAlbumsParser.parse photos_content, single: true
      
      photos.photo_urls.each do |photo_url|
        photo = photo_album.photos.build
        photo.remote_image_url = photo_url
        photo.save
      end
    end
  end
  
end
