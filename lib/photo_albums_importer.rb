class PhotoAlbumsImporter
  
  def link_to_uri(link)
    uri = URI.parse link
    url = uri.path
    uri.path = "/api#{url}"
    uri
  end
  
  def html_photo_album_parse(html_document)
    doc = Nokogiri::HTML html_document 
    links = doc.xpath "/html/body/div/div/div/table/tbody/tr/td/div/span/table/tr/td/a"
    url = link_to_uri link.xpath("@href").text
    links.map {|link| {url: url , name: link.xpath("text()").text}}
  end
  
  def import_photo_albums
    uri = URI.parse "http://oddt.ucoz.ru/photo/"
    content = uri.read
    photo_albums = html_photo_album_parse content
    
    photo_albums.each do |photo_album|
      photo_album_new = PhotoAlbum.new name: photo_album[:name]
      photo_album_new.publish
      
      uri_photos = photo_album[:url].read
      photos = PhotoParser.parse(uri_photos, single: true)
      
      photos.urls.each do |photo_url|
        photo = PhotoAlbum::Photo.new photo_album_id: photo_album_new.id
        photo.remote_image_url = photo_url
        photo.save
      end
    end
  end
  
end
