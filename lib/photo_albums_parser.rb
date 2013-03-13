class PhotoAlbumsParser
  include HappyMapper
  
  ue = UcozExporter.new
  links_photo = ue.api_links 'photo_albums'
  links_photo.each do |link|
    xml_photo = Nokogiri::XML open(link)
    
    url_photo_album = xml_photo.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'CATEGORY_URL')]]/value/string/text()"
    name_photo_album = xml_photo.xpath "/methodResponse/params/param/value/struct/member[name[contains(text(), 'CATEGORY_NAME')]]/value/string/text()"

    url_photos = "http://oddt.ucoz.ru/api" << url_photo_album.text
    
    xml_photos = Nokogiri::XML open(url_photos)
    photo_urls = xml_photos.xpath "/methodResponse/params/param/value/array/data/value/struct/member[name[contains(text(), 'PHOTO_URL')]]/value/string/text()"
    
    p = PhotoAlbum.find_by_name(name_photo_album.text)
    
    if p.present? and p.name != name_photo_album.text 
      
      photo_album = PhotoAlbum.new name: name_photo_album.text
      photo_album.publish
    
      photo_urls.each do |photo_url|
        photo = PhotoAlbum::Photo.new photo_album_id: photo_album.id
        photo.remote_image_url = photo_url.text
        photo.save
      end
      photo_album.save
    end
    
  end
end
